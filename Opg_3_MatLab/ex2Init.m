clc
clear
close all
%% Parameters
g = 9.82;  % Gravitational acceleration
c = 10;    % Drag coefficient
m = 900;   % Mass of vehicle
%% Operating point
vBar = 10; % Operating point speed
%% Controller gains
Kp = 1000; % Proportional gain
Ti = 1.6;  % Integral time