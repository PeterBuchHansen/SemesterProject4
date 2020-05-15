clc;
clear;
close all;
sin(1)
%%
% Values
s = tf('s');
mc=0.9+0.1; 
mp=0.08887;
l= 0.36022;
g = 9.81;
% Inputs
b = 1;




%% This part below was to create a state space model
TFCDen1 = [mc+2*mp 0 0];
TFCDen2 = [(2*l*mp+l*mc)*(mc+2*mp) 0 (g*mc+g*mp)*(mc+2*mp)*l 0];


TFcart1 = tf([0 1],TFCDen1)
TFcart2 = tf([0 1],TFCDen2 )
TFcart3 = tf([0 1],TFCDen1)
TFcart4 = tf([0 1],TFCDen2 )


I = [1 0 0 0;
      0 1 0 0;
      0 0 1 0;
      0 0 0 1];

A = [0 1 0 0;
     0 0 (-g*mp)/(mc+2*mp) 0;
     0 0 0 1;
     0 0 -(g*(mp+mc))/(l*(mc+2*mp)) 0];

% A = [0 0 1 0;
%      0 0 0 1;
%      0 (-g*mp)/(mc+2*mp) 0 0;
%      0 -(g*(mp+mc))/(l*(mc+2*mp)) 0 0]
   
B = [0 0;
     1/(mc+2*mp) 1/(l*(mc+2*mp));
     0 0;
     -1/(l*(mc+2*mp)) -(mc+mp)/(l^2*mp*(mc+2*mp))];

% C = [B A*B A*A*B A*A*A*B] 
% rank(C)

% s4 = [0 0 0 1;
%       0 0 0 1]*inv(C)
% s3 = s4*A;
% s2 = s3*A
% s1 = s2*A

C = [1 0 0 0;
     0 0 1 0];
 
D = [0 0;0 0];

% motor = ss(A, B, C, D, 'InputName','u', 'OutputName', {'x','th'})

% pole(motor)
% isstable(motor)
% step(motor)
 
% u = [F-Fcart; Fpend];
% It uses rational numbers instead of decimals.
% G = C*inv(s*I-A)*B*u
% figure
% step(G(1))
% figure
% step(G(2))