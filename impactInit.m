% initial impact function 
% ONLY calculates the velocity that follows the impact

%assumed: horizontal hit


function [a, vx, vy, dx, dy, time] = impactInit(a, vx, vy, dx, dy, t0, force, radius, mass)

%setting up initial values at start of function (included as foundation) 
vx0 = vx(t0);
vy0 = vy(t0);
%time stored as a millisecond. convert to seconds for calculations
sec = floor(t0*1000);

%calculating the immediate resulting velocities after hit
vx1 = (force*radius*sec)/((-mass*radius)+((4/3)*pi()*radius*radius));
vy1 = 0;

%saving related values: 
a(t0+1) = a(t0);
vx(t0+1) = vx1;
vy(t0+1) = vy1;
dx(t0+1) = dx(t0);
dy(t0+1) = dy(t0);
time = (sec+1)/1000; 