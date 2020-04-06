screenx = 60;
screeny = 60;
xlim([0, screenx]);
ylim([0, screeny]);

marble = UserPolygon2(UserArcFunction([30, 60], -2*pi:0.1:2*pi, 1), 'blue');
obs1 = UserPolygon2(UserArcFunction([40, 0], -2*pi:0.1:2*pi, 20), 'red');
obs2 = UserPolygon2([[0, 40]; [30, 45]], 'red');

% obstacle array, N is number of obstacles
N = 2;
obstacles = [obs1, obs2];

% generate obstacles
for i = 1:N  
    obs = obstacles(i);
    obs.draw();
    
    obs = obs.updatepoints();
    obstacles(i) = obs;
end

g = 9.81;
m_marble = 1.27e-3;

% mass of marble 1.27 grams
% start with  impact velocity
% assume impulse of 0.001 N*s
v_imp = [0.001 / m_marble, 0];

dt = 0.05;

for t = 0:dt:5
    marble = marble.updatepoints();
    
    % marble velocity due to gravity
    v_g = -g * t;
    
    for obs = obstacles
        
        % check if the array has intersection (if we have a collision)
        if isempty(intersect(marble.points, obs.points, 'row')) == 0
            
            % finding a collision point
            collisionpts = intersect(marble.points, obs.points, 'row');
            temp = size(collisionpts);
            i_centre = uint16(temp(1) / 2);
            centrept = collisionpts(i_centre, :);
            
            % new impact velocity based on total velocity before
            v_imp = v_imp + impact(v_imp + [0, v_g], obs.normal(centrept));
        end
    end
    
    marble = marble.move([0, dt * v_g]);
    marble = marble.move(v_imp .* [dt, dt]);
    
    marblehandle = marble.draw();
    pause(dt);
    
    delete(marblehandle);
end

lastmarble = marble.draw();
