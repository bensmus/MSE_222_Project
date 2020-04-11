function vertices = UserArcFunction(center, anglevect, radius)
    % center is 1x2
    % anglevect is 1xn
    x = radius * cos(anglevect) + center(1);
    y = radius * sin(anglevect) + center(2);
    vertices = [x.' , y.'];  
end
