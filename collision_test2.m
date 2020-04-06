screenx = 60;
screeny = 60;
xlim([0, screenx]);
ylim([0, screeny]);

% will take ten seconds real time
% will move 100 units to the right

jeff_polygon = UserPolygon2([[0, 0]; [10, 10]; [30, 20]], 'red');
sarah_polygon = UserPolygon2([[50, 50]; [40, 35]; [30, 20]], 'green');
marble = UserPolygon2(UserArcFunction([0, 59], -2*pi:0.1:2*pi, 0.7), 'blue');

for t = 0:0.1:3
    % getting up to date point data
    jeff_polygon = jeff_polygon.updatepoints();
    sarah_polygon = sarah_polygon.updatepoints();
    marble = marble.updatepoints();
    
    % finding common points between polygons
    common = intersect(jeff_polygon.points, sarah_polygon.points, 'rows')
    
    % moves the polygon to the right one unit
    jeff_polygon = jeff_polygon.move([0.1, 0]);
    sarah_polygon = sarah_polygon.move([-0.1, -0.15]);
    marble = marble.move([0, -0.1]);
    
    % handle is the drawing of the polygon this iteration
    jeffhandle = jeff_polygon.draw();
    sarahhandle = sarah_polygon.draw();
    marblehandle = marble.draw();
    
    pause(0.1);
    delete(jeffhandle);
    delete(sarahhandle);
    delete(marblehandle);
end

lastjeff = jeff_polygon.draw();
lastsarah = sarah_polygon.draw();
lastmarble = marble.draw
