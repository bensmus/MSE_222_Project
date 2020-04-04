% PROBABLY NOT USED, ACCELERATION NEEDS DOUBLE CHECK ! 


% function that returns the Vy and Vx after an impact(based on Lec21)

% R = radius of marble
% E = coefficient of restitution (material dependent. use look-up table)

%only for immediately after vertical impact
%assumed: time is 1 ms increments

function [a, vx, vy, dx, dy, time] = impactVert(a, vx, vy, dx, dy, t0, radius, E)
%initial values
omega0 = sqrt((vx^2)+(vy^2))/radius;
vx0 = vx(t0);
vy0 = vy(t0);
v0 = sqrt(vx0^2 + vy0^2);
a0 = a(t0);

%values after impacting ground
vy1 = (-E)*(vy);
vx1 = (5/7)*(vx-((2/5)*omega0*radius));
v1 = sqrt(vy1^2 + vx1^2);
a1 = (v1-v0)/t;

%saving values
vx(t0+1) = vx1;
vy(t0+1) = vy1; 
a(t0+1) = a0 + a1; 
