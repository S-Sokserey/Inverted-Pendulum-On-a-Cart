clear all
close all
clc 

m = 1; M = 5; L = 2; g = -10; d =1; 

b = 1; % pendulum up (b=1)

tspan = 0:0.1:50; 

x0 = [0; 0; pi; .5]; 

[t,y]= ode45(@(t,y)cartpend(y,m,M,L,g,d,0),tspan,x0);


for k=1:length(t)
    drawcartpend(y(k,:),m,M,L);
end 