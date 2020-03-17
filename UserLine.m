function [points] = UserLine(vertexA, vertexB)
    points = [vertexA]
    difference_vector = vertexB - vertexA
    for i = 0.01:0.01:1
        points = [points; vertexA + difference_vector * i];
    end
    points = uint8(points);
    

