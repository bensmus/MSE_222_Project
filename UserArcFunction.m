function vertices = UserArcFunction(center, anglevect, radius)
    x = radius * cos(anglevect) + center(1);
    y = radius * sin(anglevect) + center(2);
    vertices = [x.' , y.'];  
end
