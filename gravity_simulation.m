screenx = 60;
screeny = 60;
xlim([0, screenx]);
ylim([0, screeny]);

marble = UserPolygon2(UserArcFunction([10, 50], 0:0.1:2*pi, 0.7), 'blue');
obs1 = UserPolygon2([[0, 30]; [60, 0]], 'red');

% slanted is a static polygon and does not need to be inside the loop
obs1 = obs1.updatepoints();
obs1.draw();

% obstacle array
obs = [obs1];

g = 9.81;

for t = 0:0.1:3
    marble = marble.updatepoints();
    v = g * t
    
    marble = marble.move([0, -0.1 * v]);
   
    marblehandle = marble.draw();
    pause(0.1);
    
    delete(marblehandle);
end