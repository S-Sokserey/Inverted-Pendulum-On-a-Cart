
function dy = cartpend(y,m,M,L,g,d,u)

Sx = sin(y(3));
Cx = cos(y(3));
D = m*L*L*(M+m*(1-Cx^2)); 

dy(1,1) = y(2); 
dy(2,1) = (1/D)*(-m^2*L^2*g*Cx*Sx + m*L^2*(m*L*y(4)^2*Sx-d*y(2))) + m*L^2*(1/D)*u; 
dy(3,1) = y(4);
dy(4,1) = (1/D)*((m+M)*m*g*L*Sx-m*L*Cx*(m*L*y(4)^2*Sx - d*y(2))) + m*L^2*Cx*(1/D)*u; 

end 