%Calculate the distance from designed path at each time stamp
u = linspace(0,5*pi,118); % define a set of evenly spaced points between 0 and 2*pi
r = [(-0.8E0).*(0.6E0+(0.4E0+(-1).*cos(u.*0.2)).*cos(u.*0.2));0.8E0.*(0.4E0+(-1).*cos(u.*0.2)).*sin(u.*0.2);0*u.*0.2];% define the position vector
That = [(0.32E0+(-0.16E1).*cos(u.*0.2)).*(0.7424E0+(-0.512E0).*cos(u.*0.2)).^(-1/2) .*sin(u.*0.2);(0.7424E0+(-0.512E0).*cos(u.*0.2)).^(-1/2).*(0.32E0.*cos(u.*0.2)+(-0.8E0).*cos(u.*0.2).^2+0.8E0.*sin(u.*0.2).^2);0*u.*0.2];
Na = cos(0.14E1+u.*0.2).*((-0.278091E1).*cos(0.14E1+u.*0.2).*cos(0.371E1+ 0.265E1.*u.*0.2)+(-0.10494E1).*sin(0.14E1+u.*0.2).*sin(0.371E1+0.265E1.*u.*0.2)).*(cos(0.14E1+u.*0.2).^4.*(0.773346E1.*cos(0.371E1+0.265E1.*u.*0.2).^2+(-0.217626E-15).*sin(0.14E1+u.*0.2).^2)+0.868932E1.*cos(0.14E1+u.*0.2).^2.*cos(0.371E1+0.265E1.*u.*0.2).^2.*sin(0.371E1+0.265E1.*u.*0.2).^2+0.27531E0.*sin(0.28E1+2.*u.*0.2).^2.*sin(0.371E1+0.265E1.*u.*0.2).^2+(0.174101E-14.*cos(0.371E1+0.265E1.*u.*0.2).^2+0.123735E1.*sin(0.14E1+u.*0.2).^2).*sin(0.371E1+0.265E1.*u.*0.2).^4+0.364786E0.*csc(0.14E1+u.*0.2).^2.*sin(0.28E1+2.*u.*0.2).^3.*sin(0.742E1+0.53E1.*u.*0.2)+0.163949E1.*sin(0.28E1+2.*u.*0.2).*sin(0.371E1+0.265E1.*u.*0.2).^2.*sin(0.742E1+0.53E1.*u.*0.2)).^(-1/2);
Nb = sin(0.371E1+0.265E1.*u.*0.2).*(0.294776E1.*cos(0.14E1+u.*0.2).*cos(0.371E1+0.265E1.*u.*0.2)+0.111236E1.*sin(0.14E1+u.*0.2).*sin(0.371E1+0.265E1.*u.*0.2)).*(cos(0.14E1+u.*0.2).^4.*(0.773346E1.*cos(0.371E1+0.265E1.*u.*0.2).^2+(-0.217626E-15).*sin(0.14E1+u.*0.2).^2)+0.868932E1.*cos(0.14E1+u.*0.2).^2.*cos(0.371E1+0.265E1.*u.*0.2).^2.*sin(0.371E1+0.265E1.*u.*0.2).^2+0.27531E0.*sin(0.28E1+2.*u.*0.2).^2.*sin(0.371E1+0.265E1.*u.*0.2).^2+(0.174101E-14.* cos(0.371E1+0.265E1.*u.*0.2).^2+0.123735E1.*sin(0.14E1+u.*0.2).^2).*sin(0.371E1+0.265E1.*u.*0.2).^4+0.364786E0.*csc(0.14E1+u.*0.2).^2.*sin(0.28E1+2.*u.*0.2).^3.*sin(0.742E1+0.53E1.*u.*0.2)+0.163949E1.*sin(0.28E1+2.*u.*0.2).*sin(0.371E1+0.265E1.*u.*0.2).^2.*sin(0.742E1+0.53E1.*u.*0.2)).^(-1/2);
Nc = zeros(1,100);
Nhat = [((-0.264E1).*cos(u.*0.2).^2+0.16E1.*cos(u.*0.2).^3+0.216E1.*sin(u.*0.2).^2+cos(u.*0.2).*(0.464E0+(-0.8E0).*sin(u.*0.2).^2)).*(0.83209E1+0.555112E-16.*cos(u.*0.2).^5+(-0.381639E-16).*cos(u.*0.2).^6+(-0.29088E1).*sin(u.*0.2).^2+0.572459E-15.*cos(u.*0.2).^4.*sin(u.*0.2).^2+0.381639E-16.*sin(u.*0.2).^6+cos(u.*0.2).^3.*((-0.288E0)+(-0.555112E-15).*sin(u.*0.2).^2)+cos(u.*0.2).^2.*(0.29088E1+(-0.572459E-15).*sin(u.*0.2).^4)+cos(u.*0.2).*((-0.106099E2)+0.864E0.*sin(u.*0.2).^2+0.277556E-15.*sin(u.*0.2).^4)).^(-1/2);(-0.4E0).*sin(u.*0.2).*(0.116E1+(-0.12E2).*cos(u.*0.2)+0.7E1.*cos(u.*0.2).^2+0.1E1.*sin(u.*0.2).^2).*(0.83209E1+0.555112E-16.*cos(u.*0.2).^5+(-0.381639E-16).*cos(u.*0.2).^6+(-0.29088E1).*sin(u.*0.2).^2+0.572459E-15.*cos(u.*0.2).^4.*sin(u.*0.2).^2+0.381639E-16.*sin(u.*0.2).^6+cos(u.*0.2).^3.*((-0.288E0)+(-0.555112E-15).*sin(u.*0.2).^2)+cos(u.*0.2).^2.*(0.29088E1+(-0.572459E-15).*sin(u.*0.2).^4)+cos(u.*0.2).*((-0.106099E2)+0.864E0.*sin(u.*0.2).^2+0.277556E-15.*sin(u.*0.2).^4)).^(-1/2);0*u.*0.2];


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


T(1,:) = [];
T = T - 3.45;
%Calculating measured angle at each timestamp
angle = zeros(1,118);

for i=2:118
    angle(i) = angle(i-1)+ang(i-1)*Tdel(i-1);

end

%Calculating x,y position
Xdis = zeros(1,118);
Ydis = zeros(1,118);
for i = 2:118
    Xdis(i) = Xdis(i-1) +(V(i-1)*Tdel(i-1))*cos(angle(i));
    Ydis(i) = Ydis(i-1) + (V(i-1)*Tdel(i-1))*sin(angle(i));
end

error = zeros(1,118);
size(r)
for n = 1:118
    error(n) = sqrt((Ydis(n)-r(1,n))^2+(-Xdis(n)-r(2,n))^2);
end

plot(u,error)

title('Distance from Planned Path')
ylabel('Distance(m)')
xlabel('Time(s)')
