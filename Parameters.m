clear all
clc

r = 0.008;        % Motor pinion radius (m)
M= 0.2;           % Mass of the cart (kg)
I = 0.0025;        % Mass moment of inertia of pendulum rod (M*L^2)*1/3  (Kgm^2)
l = 0.45;         % Pendulum length from pivot to centre of gravity (m)
g = 9.81;         % gravitational constant (m/sec^2)
b= 0.000007892;    % Viscous damping of pendulum (Nm/rad/sec)
Rm = 7.424;        % Motor armature resistance (ohm)
kb = 0.03733;      % Motor back emf constant (V/rad/sec)
kt = 0.03733;      % Motor torque constant (Nm/A)
c = 5;         % Viscous friction coefficient for cart displacement (Nm/sec)
m = 0.038;        % Mass of the pendulum rod (kg)



Er = 2*m*g*l;
n= 3;
AA = I*(M+m) + M*m*(l^2);
aa = (((m*l)^2)*g)/AA;
bb = ((I +m*(l^2))/AA)*(c + (kb*kt)/(Rm*(r^2)));
cc  = (b*m*l)/AA;
dd  = (m*g*l*(M+m))/AA;
ee  = ((m*l)/AA)*(c + (kb*kt)/(Rm*(r^2)));
ff  = ((M+m)*b)/AA;
mm = ((I +m*(l^2))*kt)/(AA*Rm*r);
nn = (m*l*kt)/(AA*Rm*r);
A  =  [0 0 1 0; 0 0 0 1; 0 aa -bb -cc; 0 dd -ee -ff];
B = [0;0; mm; nn]; 
Q = diag([1200 1500 0 0]);
R  = 0.01;
KK = lqr(A,B,Q,R);


p1 = [1i*2.8; -1i*2.8; 1i*1.5; -1i*1.5]; % oscillatory
p2 =[-8+1i*2; -8-1i*2; -7+1i*2; -7-1i*2 ]; % underdamped
p3 =[-8; -10; -4.5; -5.8];  % stable. 
p4 =[-20; -15.5; -45.5; -50.8];  % Fast or Aggressive.
k = place(A,B,p4);