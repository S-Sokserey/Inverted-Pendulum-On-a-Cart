clear all 
close all 
clc 

m = 1; M = 5; L = 2; g = -10; d =1; 

s = 1; % pendulum up (s=1)

A = [0 1 0 0;
     0 -d/M -m*g/M 0;
     0 0 0 1; 
     0 -s*d/(M*L) -s*(m+M)*g/(M*L) 0];

B = [0; 1/M; 0; s*1/(M*L)]; 

%Check the pendulum cart is controllable
eig(A);
ctrb(A,B);
rank(ctrb(A,B));


