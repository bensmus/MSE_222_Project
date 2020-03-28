screenx = 600;
screeny = 600;
xlim([0, screenx]);
ylim([0, screeny]);

% will take ten seconds real time
% will move 100 units to the right

jeff_polygon = UserPolygon2([[0, 0]; [100, 100]; [300, 200]], 'red');
sarah_polygon = UserPolygon2([[500, 500]; [400, 350]; [300, 200]], 'green');

for t = 0:0.1:10
    % getting up to date point data
    jeff_polygon = jeff_polygon.updatepoints();
    sarah_polygon = sarah_polygon.updatepoints();
    
    % finding common points between polygons
    common = intersect(jeff_polygon.points, sarah_polygon.points, 'rows')
    
    % moves the polygon to the right one unit
    jeff_polygon = jeff_polygon.move([1, 0]);
    sarah_polygon = sarah_polygon.move([-1, -1.5]);
    
    % handle is the drawing of the polygon this iteration
    jeffhandle = jeff_polygon.draw();
    sarahhandle = sarah_polygon.draw();
    
    pause(0.1);
    delete(jeffhandle);
    delete(sarahhandle);
end

lastjeff = jeff_polygon.draw();
lastsarah = sarah_polygon.draw();
