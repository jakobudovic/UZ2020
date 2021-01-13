function hough_draw_circles(I, x, y, r)
% Draws the circles calculated by Hough transform to an image
%
% Input:
%  - I: image
%  - x: x coordinates
%  - y: y coordinates
%  - r: radii

circle_x = cos(linspace(0, 2*pi, 100));
circle_y = sin(linspace(0, 2*pi, 100));

imshow(I);
hold on;
for i = 1 : length(x)
    plot(circle_x * r(i) + x(i), circle_y * r(i) + y(i), 'g');
end
hold off;
