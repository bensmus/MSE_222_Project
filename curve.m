function p_vect_update = curve(p_vect, time_in_seconds, r, dt)
    % ignoring gravity for now 
    
    % derivative of position
    v_vect = diff(p_vect);

    % initial position and velocity before ramp
    p_o = p_vect(end, :);
    v_o = v_vect(end, :);
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
    
    u = [-1, 0];
    for i = 1:length(a_vect_update)
        a_vect_update(i, :) = u;
        u = rotation(u.', dtheta).';
    end
    
    a_vect_update = a_vect_update * a_mag
    v_vect_update = v_o + cumsum(a_vect_update) * dt;
    p_vect_update = p_o + cumsum(v_vect_update)* dt;
end

function rotated_vector = rotation(vector, angle)
    % deals with column vector
    
    M = [[cos(angle), -sin(angle)];[sin(angle), cos(angle)]];
    rotated_vector = M*vector;
end