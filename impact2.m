%inputs: velocity vector, normal vector, mass, radius

function [vx vy] = impact2(v_init, obs_norm)
vf = impact(v_init, obs_norm)