%{ 
Make a polygon class that is defined by a set of vertices. 
The correspoinding instance has methods for drawing itself, 
and for detecting collisions with another instance. 
%}


% Creating a 3D array for RGB image:
screenx = 600;
screeny = 600;
screen = zeros(screenx, screeny, 3);

% Accessing channels of the 3D array:  
red = screen(:, :, 1);
green = screen(:, :, 2);
blue = screen(:, :, 3);

% We can now modify the red channel, which is a 2D array of scalars
% currently set to zero.

% Creating UserPolygon objects:
my_polygon1 = UserPolygon([[5, 5]; [100, 10]; [100, 100] ; [10, 100]; [5, 5]])
my_polygon2 = UserPolygon([[100, 100]; [200, 200]; [200, 100]; [100, 100]])

% Drawing the polygons
red = my_polygon1.draw(red);
green = my_polygon2.draw(green);

screen = cat(3, red, green, blue);
imshow(screen)


polygons = [my_polygon1, my_polygon2]
collision_points = my_polygon1.collision(my_polygon2)




