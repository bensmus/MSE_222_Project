%straght path 

%intention: the first path (maybe can be used for all)

function [a, vx, vy, dx, dy, time] = straightPath(a, vx, vy, dx, dy, t0, length, radius, mass)

%time stored as a millisecond. convert to seconds for calculations
sec = floor(t0*1000);

%setting up initial values at start of function (included as foundation) 
vx0 = vx(t0);
vy0 = vy(t0);