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
        
        % collision points
        function [collision_points] = collision(obj, polygon)
            
            % note the .' syntax means transpose
            % for loop in matlab default iterates over columns
            % so we are sort of switching there, then back
            collision_points = []
            for objpoint = obj.points.'
                for polpoint = polygon.points.'
                    if objpoint == polpoint
                        collision_points = [collision_points ; objpoint.']
                    end
                end
            end
        end
        
    end
    
end

