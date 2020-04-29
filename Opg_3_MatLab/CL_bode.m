s = tf('s');
k = 0.005;
Kp = 1000;
Ti = 1.6;
tau = 4.6;

K = Kp*((s+(1/Ti))/(s));
G = k / (tau*s+1);

cL = (K*G)/(1+K*G);

bode(cL)

f = (1.49/(2*pi)) * 30
T = 1/f

ans = 0.3125*0.1406
ans1 = -1

ans2 = 1000 (ans - ans1);