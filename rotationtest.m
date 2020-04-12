function rotated_vector = rotation(vector, angle)
    % deals with column vector
    
    M = [[cos(angle), -sin(angle)];[sin(angle), cos(angle)]];
    rotated_vector = M*vector;
end