% each position is spaced out by 0.01 seconds
% everything is in base SI units
clc; clear; close all;

dt = 0.01;

%static friction coefficient for wood material 
u = 0.9; 

%marble mass
m = 0.05;
pend_m = 0.5;

% stationary marble in time
p_vect = [[0.01, 0.59]; [0.01, 0.59]];
% we hit it 
p_vect = [p_vect; hit(p_vect, m, 0.1, dt)];
% flat path
p_vect = [p_vect; ramp(p_vect, 1.07, dt, 0, u)];
flat_endpoint = p_vect(end,:)
% then gravity turns on
p_vect = [p_vect; drop(p_vect, 0.1, dt)];
% bounce
p_vect = [p_vect; bounce(p_vect, 0.1, dt)];


r_start = [p_vect(end,:)];
angles = [182];
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.3, dt, 182, u)];
% pendulum in middle of ramp
pends = [p_vect(end,:)];
p_vect = [p_vect; pend(p_vect, 0.6, dt, m, pend_m, 182)];
% continues on ramp
p_vect = [p_vect; ramp(p_vect, 0.5, dt, 182, u)];
% pendulum in middle of ramp
pends = [pends; p_vect(end,:)];
p_vect = [p_vect; pend(p_vect, 0.6, dt, m, pend_m, 182)];
% continues on ramp
p_vect = [p_vect; ramp(p_vect, 0.5, dt, 182, u)];
% pendulum in middle of ramp
pends = [pends; p_vect(end,:)];
p_vect = [p_vect; pend(p_vect, 0.6, dt, m, pend_m, 182)];
% continues on ramp
p_vect = [p_vect; ramp(p_vect, 0.5, dt, 182, u)];
% pendulum in middle of ramp
pends = [pends; p_vect(end,:)];
p_vect = [p_vect; pend(p_vect, 0.6, dt, m, pend_m, 182)];
% continues on ramp
p_vect = [p_vect; ramp(p_vect, 0.5, dt, 182, u)];
% then gravity turns on
p_vect = [p_vect; drop(p_vect, 0.1, dt)];
% bounce
p_vect = [p_vect; bounce(p_vect, 0.1, dt)];


r_start = [r_start;p_vect(end,:)];
angles = [angles; -1];
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.7, dt, -1, u)];
% pendulum in middle of ramp
pends = [pends; p_vect(end,:)];
p_vect = [p_vect; pend(p_vect, 0.6, dt, m, pend_m, -1)];
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.79, dt, -1, u)];
% then gravity turns on
p_vect = [p_vect; drop(p_vect, 0.1, dt)];
% bounce
p_vect = [p_vect; bounce(p_vect, 0.1, dt)];

r_start = [r_start;p_vect(end,:)];
angles = [angles; 182];
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.3, dt, 182, u)];
% pendulum in middle of ramp
pends = [pends; p_vect(end,:)];
p_vect = [p_vect; pend(p_vect, 0.7, dt, m, pend_m, 182)];
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.6, dt, 182, u)];
% pendulum in middle of ramp
pends = [pends; p_vect(end,:)];
p_vect = [p_vect; pend(p_vect, 0.7, dt, m, pend_m, 182)];
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.6, dt, 182, u)];
% pendulum in middle of ramp
pends = [pends; p_vect(end,:)];
p_vect = [p_vect; pend(p_vect, 0.7, dt, m, pend_m, 182)];
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.54, dt, 182, u)];
% then gravity turns on
p_vect = [p_vect; drop(p_vect, 0.1, dt)];
% bounce
p_vect = [p_vect; bounce(p_vect, 0.1, dt)];


r_start = [r_start;p_vect(end,:)];
angles = [angles; -1];
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 1.06, dt, -1, u)];
% then gravity turns on
p_vect = [p_vect; drop(p_vect, 0.1, dt)];
% bounce
p_vect = [p_vect; bounce(p_vect, 0.1, dt)];


r_start = [r_start;p_vect(end,:)]
angles = [angles; 185]
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.3, dt, 185, u)];
% pendulum in middle of ramp
pends = [pends; p_vect(end,:)];
p_vect = [p_vect; pend(p_vect, 0.7, dt, m, pend_m, 185)];
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.6, dt, 185, u)];
% pendulum in middle of ramp
pends = [pends; p_vect(end,:)];
p_vect = [p_vect; pend(p_vect, 0.7, dt, m, pend_m, 185)];
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.6, dt, 185, u)];
% pendulum in middle of ramp
pends = [pends; p_vect(end,:)]
p_vect = [p_vect; pend(p_vect, 0.7, dt, m, pend_m, 185)];
% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.53, dt, 185, u)];
% then gravity turns on
d_s = p_vect(end, :);
p_vect = [p_vect; drop(p_vect, 0.1, dt)];
d_s2 = p_vect(end, :);
d = d_s2 - d_s
% % bounce
% p_vect = [p_vect; bounce(p_vect, 0.1, dt)];
%}
% % pendulum in middle of ramp
% p_vect = [p_vect; pend(p_vect, 0.1, dt, m, pend_m, 0)];
% 
% % continues on ramp
% p_vect = [p_vect; ramp(p_vect, 0.1, dt, 0, u, m)];

% function p_vect_update = curve(p_vect, time_in_seconds, r, dt)
% simplified curved path without gravity
p_vect = [p_vect; curve(p_vect, 6, 0.05, dt)];

% outputting the amount of time used (pos stored in 0.01s) 
% length-2 deals with the positions of stationary marble added initially
time_in_seconds = (length(p_vect)-2)/100;
%saving the velocity vector of the entire track
v_vect = 10*diff(p_vect);


scatter(100 * p_vect(:, 1), 100 * p_vect(:, 2));

xlim([0, 60])
ylim([0, 60])

% these functions always return update mx2 position vector
function p_vect_update = hit(p_vect, m_marble, time_in_seconds, dt)

    % hits the marble with a 1N force 
    % in x direction over duration of 1 ms
    % impulse is 0.001 N*s
    % model this as velocity increase by 0.001/(m_marble)
    
    % in m/s
    v_vect = diff(p_vect);
    
    % initial position and velocity before hit
    p_o = p_vect(end, :);
    v_o = v_vect(end, :);
    
    v_o_new = v_o + [0.001 / m_marble, 0];
    
    v_vect_update = v_o_new + zeros(time_in_seconds * 1/dt, 2);
    
    % integrating with dt
    p_vect_update = p_o + cumsum(v_vect_update) * dt;
end


function p_vect_update = drop(p_vect, time_in_seconds, dt)
    
    % g = 9.81 m/(s^2) 
    
    v_vect = diff(p_vect);
    
    % initial position and velocity before drop
    p_o = p_vect(end, :);
    v_o = v_vect(end, :);
    
    a_vect_update = [0, -9.81] + zeros(time_in_seconds * 1/dt, 2);
    
    % integrating once
    v_vect_update = v_o + cumsum(a_vect_update) * dt;
    
    % integrating again
    p_vect_update = p_o + cumsum(v_vect_update) * dt;
end


function p_vect_update = ramp(p_vect, time_in_seconds, dt, theta, static_fr)
    % g = 9.81 m/(s^2)
    
    v_vect = diff(p_vect);
    
    % initial position and velocity before ramp
    p_o = p_vect(end, :);
    v_o = v_vect(end, :);
    v_mag = norm(v_o);
    
    
    % going down the ramp = (positive) direction
    a_vect_update = [(1-static_fr)*cosd(theta)*9.81 (1-static_fr)*sind(theta)*9.81] + zeros(time_in_seconds * 1/dt, 2);
    % (10/7) would take into account the moment of inertia of marble ?
    
    % ignore this section for now 
    
%     v_2 = sqrt(v_mag^2 + (10/7)*9.81*sind(theta))
%     v_2 = v_o + (10/7)*-9.81*sind(theta)
%    v_vect_2 = [v_2*cosd(theta) v_2*sind(theta)]
    
%     a_vect_update = diff(v_vect_2) + zeros(time_in_seconds * 1/dt, 2);
%     a_vect_update = [v_2-v_o] + zeros(time_in_seconds * 1/dt, 2);
    
    % int for velocity
    v_vect_update = v_o + cumsum(a_vect_update) * dt;    
    
    %int for position
    p_vect_update = p_o + cumsum(v_vect_update) * dt;
end 


%causes very minimal differences; neglibigle
function p_vect_update = bounce(p_vect, time_in_seconds, dt)
    v_vect = diff(p_vect);

    % initial position and velocity before ramp
    p_o = p_vect(end, :);
    v_o = v_vect(end, :);
    v_mag = norm(v_o);
    
    %coefficient of restitution for wood material
    e = 0.557;
    
    %final velocities after bounce
    vf = [(5/7)*(v_o(1)-(2/5)*v_mag) -e*v_o(2)*9.81];
    
    a_vect_update = [vf-v_o] + zeros(time_in_seconds * 1/dt, 2);
    
    % int for velocity
    v_vect_update = v_o + cumsum(a_vect_update) * dt;
    
    %int for position
    p_vect_update = p_o + cumsum(v_vect_update)* dt;
end 

%pendulum is a rod-structure mounted on a pin joint
function p_vect_update = pend(p_vect, time_in_seconds, dt, marble_mass, pend_mass, theta)

    v_vect = diff(p_vect);

    % initial position and velocity before ramp
    p_o = p_vect(end, :);
    v_o = v_vect(end, :);
    v_mag = norm(v_o);
    
    %coefficient of restitution for wood material
    e = 0.557;
    
    %conservation of angular momentum about the pendulum pin joint
    v_mag1 = (marble_mass * v_mag - ((1/3) * pend_mass * e * v_mag)) / ((1/3 * pend_mass) + marble_mass);
    
    %finding the compondents
    vf = [v_mag1*cosd(theta) v_mag1*9.81*sind(theta)];
    
    a_vect_update = [vf-v_o] + zeros(time_in_seconds * 1/dt, 2);
    
    % int for velocity
    v_vect_update = v_o + cumsum(a_vect_update) * dt;
    
    %int for position
    p_vect_update = p_o + cumsum(v_vect_update)* dt;
    
end 

function p_vect_update = curve(p_vect, time_in_seconds, r, dt)
    % ignoring gravity for now 
    
    % derivative of position
    v_vect = diff(p_vect);

    % initial position and velocity before ramp
    p_o = p_vect(end, :);
    v_o = v_vect(end, :)
    v_mag = norm(v_o);
    
    % depending on the initial speed of the marble,
    % the curved wood will exert a different force.
    a_mag = (v_mag^2)/r;
    
    % get an array of unit vectors for the direction of the inwards 
    % acceleration.      
    w_mag = v_mag/r;
    dtheta = w_mag * dt;
    
    % pre-allocate acceleration array
    a_vect_update = zeros(time_in_seconds/dt, 2);
    
    u = [1, 0];
    for i = 1:length(a_vect_update)
        a_vect_update(i, :) = u;
        u = rotation(u.', dtheta).';
    end
    
    a_vect_update = a_vect_update * a_mag;
    v_vect_update = v_o + cumsum(a_vect_update) * dt;
    p_vect_update = p_o + cumsum(v_vect_update)* dt;
end

function rotated_vector = rotation(vector, angle)
    % deals with column vector
    
    M = [[cos(angle), -sin(angle)];[sin(angle), cos(angle)]];
    rotated_vector = M*vector;
end