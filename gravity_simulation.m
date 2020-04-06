screenx = 60;
screeny = 60;
xlim([0, screenx]);
ylim([0, screeny]);

marble = UserPolygon2(UserArcFunction([10, 50], -2*pi:0.1:2*pi, 1), 'blue');
obs1 = UserPolygon2([[0, 30]; [30, 0]], 'red');

% slanted is a static polygon and does not need to be inside the loop
obs1 = obs1.updatepoints();
obs1.draw();

% obstacle array
obstacles = [obs1];

g = 9.81;
m_marble = 1.27e-3;

% mass of marble 1.27 grams
% start with  impact velocity
% assume impulse of 0.001 N*s
v_imp = [0.001 / m_marble, 0];

for t = 0:0.1:3
    marble = marble.updatepoints();
    
    for obs = obstacles
        
        % check if the array has intersection (if we have a collision)
        if isempty(intersect(marble.points, obs.points, 'row')) == 0
            
            % new impact velocity
            collisionpts = intersect(marble.points, obs.points, 'row');
            temp = size(collisionpts);
            i_centre = uint16(temp(1) / 2);
            centrept = collisionpts(i_centre, :);
            disp(obs.normal(centrept));
        end
    end
    
    % marble velocity due to gravity
    v_g = g * t;
    
    marble = marble.move([0, -0.1 * v_g]);
    marble = marble.move(v_imp .* [0.1, 0.1]);
    
    marblehandle = marble.draw();
    pause(0.1);
    
    delete(marblehandle);
end