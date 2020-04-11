%straght path horizontal; no vertical distance travelled

%intention: the first path (maybe can be used for all)

function [a, vx, vy, dx, dy, time] = straightPath(a, vx, vy, dx, dy, t0, length, radius, mass)

%setting up initial values at start of function (included as foundation) 
vx0 = vx(t0);
vy0 = vy(t0);
v0 = sqrt(vx0^2 + vy0^2);
dx0 = dx(t0);
dy0 = dy(t0);
a0 = a(t0);

%computing the distance travelled 
for i=1:length
    vx(t0+i) = vx(t0+(i-1)) + a0*((t0+/1000);
    vy(t0+i) = vy(t0+(i-1));
    dx(t0+i) = dx(t0+(i-1)) + 