classdef UserPolygon2

    properties
        vertices = []
        colorname = ""
        points = []
    end

    methods
        function obj = UserPolygon2(vertices, colorname)
            % vertices is a mx2 array

            obj.vertices = vertices;
            obj.colorname = colorname;
        end

        function handle = draw(obj)
            % line(x, y, 'Color', 'colorname')
            % x is a vector of all x coordinates,
            % y is a vector of all y coordinates

            x = obj.vertices(:, 1);
            y = obj.vertices(:, 2);

            % surprisingly draws a sequence of line
            handle = line(x, y, 'Color', obj.colorname, 'LineWidth', 3);
        end

        function obj = updatepoints(obj)
            % a sample of points that make up the polygon
            % useful to detect collisions
            obj.points = [];
            [m, ~] = size(obj.vertices);

            for i = 1:(m - 1)
                obj.points = [obj.points; UserLine(obj.vertices(i, :), obj.vertices(i+1, :))];
            end
        end

        function obj = move(obj, direction_vector)
            obj.vertices = obj.vertices + direction_vector;
        end
    end
end
