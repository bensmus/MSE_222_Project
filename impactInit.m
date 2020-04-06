% initial impact function 
% ONLY calculates the velocity that follows the impact

%assumed: horizontal hit, force inputted in N


function [a, vx, vy, dx, dy, time] = impactInit(a, vx, vy, dx, dy, t0, force, radius, mass)

%setting up initial values at start of function (included as foundation) 
vx0 = vx(t0);
vy0 = vy(t0);
v0 = sqrt(vx0^2 + vy0^2);
dx0 = dx(t0);
dy0 = dy(t0);

%convert force to kg*mm/ms^2 to match storage + calculations of everything
f = force/1000;

%calculating the immediate resulting velocities after hit; impact occurs for one millisecond
vx1 = (f*radius*(t0+1))/((-mass*radius)+((4/3)*pi()*radius*radius));
vy1 = 0;
v1 = sqrt(vx1^2 + vy1^2);
%assuming impact occured for one millisecond 
a1 = 2(v1-v0);

%saving related values: 
a(t0+1) = a1;
vx(t0+1) = vx1;
vy(t0+1) = vy1;
dx(t0+1) = dx0;
dy(t0+1) = dy0;
time = t0+1; 