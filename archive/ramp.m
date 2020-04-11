% does the thing to the marble and draws itself
% for all of these functions
position_array = [];

% scatter(a(:, 1), a(:, 2))

function position_array = ramp(v_in, ramp_geometry, marble_start)
% v_in is the initial velocity of the marble just before it touches the
% ramp

% ramp_geometry is the position and shape of the ramp given by an array of
% points

% 
end

function position_array = arc(v_in, marble_geometry, arc_geometry, marble_start)
% centripetal force 
end

function position_array = drop(v_in, marble_geometry, drop_geometry, marble_start)
end

function position_array = sidewall(v_in, marble_geometry, sidewall_geometry, marble_start)
end

function position_array = pend(v_in, marble_geometry, pend_geometry, marble_start)
end

function position_array = flat(v_in, marble_geometry, flat_geometry, marble_start)
end