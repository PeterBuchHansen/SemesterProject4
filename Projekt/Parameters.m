clc
clear
close all

%% Parameters
mc = 0.9;
mp = 0.1;
b = 1; 
l = 0.35;
g = 9.82;

% u1(F),
% u2(ddth)
% u3(dx)
% u4(theta)
% u5(dth)

(1/(mp+mc))*(u(1)-mp*l*u(2)*cos(u(4))+mp*l*u(5)^2*sin(u(4))-b*u(3));
% (1/(mp+mc)) * (F - mp*l*ddth*cos(th) + mp*l*dth^2*sin(th)) - b*dx

% U1(xdd)
% U2(theta)
% U3(FDist)
% assume that bp*x is neglected (no friction)
(1/(l^2*mp))*(u(3)-mp*l*u(1)*cos(u(2))+mp*g*l*sin(u(2)));
% (1/(l^2*mp))* (Fdist - mp*l*ddx*cos(th) + mp*g*l*sin(th))

