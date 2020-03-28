classdef UserArc
    
    properties
        
        % generated in init
        center;
        anglevect;
        radius;
        colorname;
        
        % generated later on
        points;
        x;
        y;
        
    end
    
    methods
        function obj = UserArc(center, anglevect, radius, colorname)
            obj.center = center;
            obj.anglevect = anglevect;
            obj.radius = radius;
            obj.colorname = colorname;
        end
        
        function obj = updatepoints(obj)
            obj.x = obj.radius * cos(obj.anglevect) + obj.center(1);
            obj.y = obj.radius * sin(obj.anglevect) + obj.center(2);
            obj.points = [obj.x.' ; obj.y'];    
        end
        
        function handle = draw(obj)
            handle = plot(obj.x, obj.y, 'Color', obj.colorname);
        end
    end
end