% each position is spaced out by 0.01 seconds
% everything is in base SI units

dt = 0.01;

% stationary marble in time
p_vect = [[0.01, 0.59]; [0.01, 0.59]];

% we hit it 
p_vect = [p_vect; hit(p_vect, 0.05, 0.1, dt)];

% flat path
p_vect = [p_vect; ramp(p_vect, 0.33, dt, 0)];

% then gravity turns on
p_vect = [p_vect; drop(p_vect, 0.1, dt)];

% bounce
p_vect = [p_vect; bounce(p_vect, 0.05, dt)];

% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.3, dt, 181)];

% pendulum in middle of ramp
p_vect = [p_vect; pend(p_vect, 0.1, dt, 0.05, 0.2, 181)];

% continues on ramp
p_vect = [p_vect; ramp(p_vect, 0.13, dt, 181)];

% then gravity turns on
p_vect = [p_vect; drop(p_vect, 0.1, dt)];

% bounce
p_vect = [p_vect; bounce(p_vect, 0.1, dt)];

% drops onto a ramp
p_vect = [p_vect; ramp(p_vect, 0.3, dt, -1)];

% pendulum in middle of ramp
p_vect = [p_vect; pend(p_vect, 0.1, dt, 0.05, 0.2, -1)];

% continues on ramp
p_vect = [p_vect; ramp(p_vect, 0.1, dt, -1)];

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


function p_vect_update = ramp(p_vect, time_in_seconds, dt, theta)
    % g = 9.81 m/(s^2)
    
    v_vect = diff(p_vect);
    
    % initial position and velocity before ramp
    p_o = p_vect(end, :);
    v_o = v_vect(end, :);
    v_mag = norm(v_o);
    
    
    % going down the ramp = (positive) direction
    a_vect_update = [9.81*cosd(theta), 9.81*sind(theta)] + zeros(time_in_seconds * 1/dt, 2);
    % (10/7) would take into account the moment of inertia of marble ?
    
    % ignore this section for now 
%     % int for velocity
%     v_vect_update = v_o + cumsum(a_vect_update) * dt;
    
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
