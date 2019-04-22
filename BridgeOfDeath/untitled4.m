load('final.mat')
%Deleting the 0s
VL = diff(dataset(:,2));
pos = dataset(1,:);
for i=1:349
    if VL(i)>0
        pos = [pos; dataset(i,:)];
    end

end
pos(1,:) = [];

XL = pos(:,2);
XR = pos(:,3);
T = pos(:,1);
XLdel = zeros(1,117);
XRdel = zeros(1,117);
Tdel = zeros(1,117);
%Calculating left and right wheel velocity
for i = 2:118
    XLdel(i-1) = XL(i)-XL(i-1);
    XRdel(i-1) = XR(i) - XR(i-1);
    Tdel(i-1) = T(i) - T(i-1);
end
VL = zeros(1,117);
VR = zeros(1,117);
for i = 1:117
    VL(i) = XLdel(i)/Tdel(i);
    VR(i) = XRdel(i)/Tdel(i);
end

%Calculating linear and Angular Velocity
V = (VL+VR)/2;
ang = (-VL+VR)/0.254;

dis = zeros(1,117);
for i = 2:118
    dis(i) = dis(i-1)+V(i-1)*Tdel(i-1);
end
T(1,:) = []
T = T - 3.45;

%Designated Left and Right wheel speed
u = linspace(0,5*pi,100); % define a set of evenly spaced points between 0 and 2*pi
VL1 = 0.2E0.*((0.7424E0+(-0.512E0).*cos(u.*0.2)).^(1/2)+(-0.127E0).*((-0.145E1)+0.1E1.*cos(u.*0.2)).^(-3).*(0.920175E1+0.3525E1.*cos(u.*0.2).^2+0.222045E-15.*cos(u.*0.2).^4+(-0.333067E-15).*cos(u.*0.2).^5+(-0.3525E1).*sin(u.*0.2).^2+0.222045E-15.*sin(u.*0.2).^4+cos(u.*0.2).^3.*((-0.375E0)+0.333067E-14.*sin(u.*0.2).^2)+cos(u.*0.2).*((-0.121088E2)+0.1125E1.*sin(u.*0.2).^2+(-0.166533E-14).*sin(u.*0.2).^4)+(-0.333067E-15).*sin(2.*u).^2));
VR1 = 0.2E0.*((0.7424E0+(-0.512E0).*cos(u.*0.2)).^(1/2)+0.127E0.*((-0.145E1)+0.1E1.*cos(u.*0.2)).^(-3).*(0.920175E1+0.3525E1.*cos(u.*0.2).^2+ 0.222045E-15.*cos(u.*0.2).^4+(-0.333067E-15).*cos(u.*0.2).^5+(-0.3525E1).* sin(u.*0.2).^2+0.222045E-15.*sin(u.*0.2).^4+cos(u.*0.2).^3.*((-0.375E0)+0.333067E-14.*sin(u.*0.2).^2)+cos(u.*0.2).*((-0.121088E2)+0.1125E1.*sin(u.*0.2).^2+(-0.166533E-14).*sin(u.*0.2).^4)+(-0.333067E-15).*sin(2.*u).^2));

%Designated Linear and Angular Velocity
Vlin = (0.7424E0+(-0.512E0).*cos(u.*0.2)).^(1/2).*((-0.145E1)+0.1E1.*cos(u.*0.2)).^(-3).*((-0.609725E0)+0.12615E1.*cos(u.*0.2)+(-0.87E0).*cos(u.*0.2).^2+0.2E0.*cos(u.*0.2).^3);
Vang = ((-0.145E1)+0.1E1.*cos(u.*0.2)).^(-3).*(0.233724E0+0.89535E-1.*cos(u.*0.2).^2+0.563993E-17.*cos(u.*0.2).^4+(-0.84599E-17).*cos(u.*0.2).^5+(-0.89535E-1).*sin(u.*0.2).^2+0.563993E-17.*sin(u.*0.2).^4+cos(u.*0.2).^3.*((-0.9525E-2)+0.84599E-16.*sin(u.*0.2).^2)+cos(u.*0.2).*((-0.307562E0)+0.28575E-1.*sin(u.*0.2).^2+(-0.422995E-16).*sin(u.*0.2).^4)+(-0.84599E-17).*sin(2.*u).^2)*2/0.254;





%Plotting left and right wheel velocity
figure()
plot(u,VL1,u,VR1)
hold on
plot(T,VL,'--')
plot(T,VR,'--')
hold off

title('Speed of Left Wheel and Right Wheel')
xlabel('time(s)')
ylabel('Speed(m/s)')


legend({'Desiganted Left Wheel','Designated Right Wheel','Measured Left Wheel','Measured Right Wheel'},'Location','southwest')


figure()
plot(u,Vlin,u,Vang)
hold on
plot(T,V,'--')

plot(T,ang,'--')
hold off

yyaxis left
title('Linear Velocity and Angular Velocity')
xlabel('time(s)')
ylabel('Linear Velocity (m/s)')

yyaxis right
ylabel('Angular Velocity (rad/s)')
legend({'Designated Linear Velocity','Designated Angular Velocity','Measured Linear Velocity','Measured Angular Velocity'},'Location','southwest')

