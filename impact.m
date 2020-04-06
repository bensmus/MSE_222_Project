% impact function (universal) 

% inputs : initial velocity vector, obstacle normal vector

% [vx vy] = impact([3 4], [0 1])
% 
% oy1 = (-E)*(vy);
% ox1 = (5/7)*(vx-((2/5)*vx));

% % function [vf] = impact(v_init, obs_norm)
% % 
% % %defining coefficient of restitution for object material: wood (calculated)
% % e = 0.557;
% % 
% % %extracting component forms for each initial vector
% % vx0 = v_init(1);
% % vy0 = v_init(2);
% % nx0 = obs_norm(1);
% % ny0 = obs_norm(2);
% % 
% % %calculate the magnitudes of each vector
% % v0 = sqrt(vx0^2 + vy0^2);
% % n0 = sqrt(nx0^2 + ny0^2);
% % 
% % %calculating the dor product of the 2 vectors
% % dotp = dot(v_init, obs_norm);
% % 
% % %finding the angle between the 2 vectors -> to find the resultant marble velocity angle
% % cosTheta = dotp / (v0*n0);
% % %theta stored as radian degrees;
% % theta = acos(deg2rad(cosTheta));
% % test_theta = rad2deg(theta);
% % %finding the degrees angle in x and y 
% % cosx = rad2deg(cos(theta));
% % siny = rad2deg(sin(theta));
% % 
% % %calculating resultant velocity, assuming if it were a flat surface w/ CoE
% % %ground is not moving, therefore terms reduce to: 
% % v1 = -e*v0;
% % 
% % %component forms of the final velocity
% % vx1 = v1 * cosx;
% % vy1 = v1 * siny;
% % 
% % vf = [vx1 vy1];

function vf = impact(v_init, obs_norm)

    %define the constitution of restitution
    e = 0.557;

    %finding the initial magnitudes
    v0 = v_init %sqrt(v_init(1)^2 + v_init(2)^2)
    n0 = obs_norm %sqrt(obs_norm(1)^2 + obs_norm(2)^2)

    %finding the dot products
    dotvn = dot(v_init, obs_norm)
    dotnn = dot(obs_norm, obs_norm)

    %finding the velocity component perp to the normal vector
    u = (dotvn / dotnn)*obs_norm

    %finding the velocity component parallel to normal vector
    w = v0 - u
    % 
    % %transforming normal vector to unit vector 
    % nu = (obs_norm)/n0
    % 
    % %finding the angle of impact
    % theta = atand(obs_norm(2)/obs_norm(1))

    %finding the resultant velocity; assuming friction is zero
    vf = w - e * u

    % %storing the final components of velocity
    % vx1 = v1 * cosd(theta)
    % vy1 = v1 * sind(theta)
    % vf = [vx1 vy1]
end













