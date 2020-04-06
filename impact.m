% impact function (universal) 

% inputs : initial velocity vector, obstacle vector

function [vx vy] = impact([vx0 vy0], [nx ny])

%calculating magnitudes of eaxh vector
v0 = sqrt(vx0^2 + vy0^2);
n0 = sqart(nx^2 + ny^2);

%storing the vector components as a vector
vv = [vx0 vy0];
nv = [nx ny];

%calculating the dor product of the 2 vectors
dotp = dot(vv, nv);

%finding the angle between the 2 vectors -> to find the resultant angle 
cosTheta = dotp / (
