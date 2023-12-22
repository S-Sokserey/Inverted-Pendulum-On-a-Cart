clear all, close all, clc

m = 1;
M = 5;
L = 2;
g = -10;
d = 1;

s = 1; % pendulum up (s=1)

A = [0 1 0 0;
    0 -d/M -m*g/M 0;
    0 0 0 1;
    0 -s*d/(M*L) -s*(m+M)*g/(M*L) 0];

B = [0; 1/M; 0; s*1/(M*L)];

Q = [10 0 0 0;
     0 10 0 0;
     0 0 10 0; 
     0 0 0 100];
R = 0.01; 


eig(A)
%rank(ctrb(A,B))  % is it controllable

%%  LQR
K = lqr(A,B,Q,R);

tspan = 0:.001:20;
if(s==-1)
    y0 = [0; 0; 0; 0];
    [t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,-K*(y-[4; 0; 0; 0])),tspan,y0);
elseif(s==1)
    y0 = [-3; 0; pi+.1; 0];
    [t,y] = ode45(@(t,y)cartpend(y,m,M,L,g,d,-K*(y-[1; 0; pi; 0])),tspan,y0);
else
end

for k=1:100:length(t)
    drawcartpend(y(k,:),m,M,L);
end