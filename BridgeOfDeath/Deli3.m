u = 0:pi/100:5*pi;
Vlin = (0.7424E0+(-0.512E0).*cos(u.*0.2)).^(1/2).*((-0.145E1)+0.1E1.*cos(u.*0.2)).^(-3).*((-0.609725E0)+0.12615E1.*cos(u.*0.2)+(-0.87E0).*cos(u.*0.2).^2+0.2E0.*cos(u.*0.2).^3);
Vang = ((-0.145E1)+0.1E1.*cos(u.*0.2)).^(-3).*(0.233724E0+0.89535E-1.*cos(u.*0.2).^2+0.563993E-17.*cos(u.*0.2).^4+(-0.84599E-17).*cos(u.*0.2).^5+(-0.89535E-1).*sin(u.*0.2).^2+0.563993E-17.*sin(u.*0.2).^4+cos(u.*0.2).^3.*((-0.9525E-2)+0.84599E-16.*sin(u.*0.2).^2)+cos(u.*0.2).*((-0.307562E0)+0.28575E-1.*sin(u.*0.2).^2+(-0.422995E-16).*sin(u.*0.2).^4)+(-0.84599E-17).*sin(2.*u).^2);

plot(u,Vlin,u,Vang)

yyaxis left
title('Linear Velocity and Angular Velocity')
xlabel('time(s)')
ylabel('Linear Velocity (m/s)')

yyaxis right
ylabel('Angular Velocity (rad/s)')
legend({'Linear Velocity','Angular Velocity'},'Location','southwest')

text(1,0.2,'The negative angular velocity represents clockwise motion.')