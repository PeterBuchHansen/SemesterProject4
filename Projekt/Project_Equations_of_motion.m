clc;
clear;
syms mc mp x dx l th dth g F Fcart Fpend ddx ddth s b Fdist

% mc=0.9+0.1; 
% mp=0.08887;
% l= 0.36022;
% g = 9.82;

%E = [(mc+mp)*ddx + mp*l*ddth == F-Fcart, mp*l^2*ddth-mp*ddx*l-mp*g*l*th == -Fpend];
%S = solve(E,ddx,ddth);
%pretty(S.ddx)
%pretty(S.ddth)

%E = [(mc+mp)*ddx + mp*l*ddth*cos(th) - mp*l*th^2*sin(th) == F-Fcart, mp*l^2*ddth+mp*ddx*l*cos(th)-mp*g*l*sin(th) == -Fpend];
E = [ddx == (1/(mp+mc)) * (F - mp*l*ddth*cos(th) + mp*l*dth^2*sin(th)) - b*dx, ddth == (1/(l^2*mp))* (Fdist - mp*l*ddx*cos(th) + mp*g*l*sin(th))]
S = solve(E,ddx,ddth);
pretty(S.ddx)
pretty(S.ddth)


