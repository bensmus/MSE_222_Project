screenx = 600;
screeny = 600;
xlim([0, screenx]);
ylim([0, screeny]);

% will take ten seconds real time
% will move 100 units to the right

for t = 1:0.1:10
    dx = t * 10;
    jeff_polygon = UserPolygon2([[0 + dx, 0]; [100 + dx, 100]; [300 + dx, 200]], 'red');

    % handle is the drawing of the polygon this iteration
    handle = jeff_polygon.draw();
    pause(0.1);
    delete(handle);
end
