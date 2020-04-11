function v = tangent_vector(points, point)
    % point array is mx2
    % point is 1x2
    
    % find index of point in points
    [~, i] = ismember(point, points, 'rows'); 
    [m, ~] = size(points);
    
    if i == m
        v = point - points(i - 1, :);
    elseif i == 1
        v = points(i + 1, :) - point;
    else
        v = points(i + 1, :) - points(i - 1, :);
    end
    
    v = v./ norm(v);
end