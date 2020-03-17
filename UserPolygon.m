classdef UserPolygon 
    
    properties
        % will become overwritten in init
        points = zeros(1, 2)
    end
    
    methods 
        
        % init
        function obj = UserPolygon(vertices)
            
            %{
            vertices is 
            [[y1, x1];
             [y2, x2]...]
            %}
            
            % make a 1x2 array that we can add to 
            obj.points = vertices(1, :);
            [m, ~] = size(vertices);
            
            for i = 1:(m - 1)
                obj.points = [obj.points; UserLine(vertices(i, :), vertices(i+1, :))];
            end
        end
        
        % draw
        function array2D = draw(obj, array2D)
            for point = obj.points.'
                array2D(point(1), point(2)) = 255;
            end
        end 
        
    end
    
end

