function hough_draw_lines(I, rho, theta)
% Draws the lines calculated by Hough transform to an image
%
% Input:
%  - I: image
%  - rho: displacement parameter
%  - theta: angle parameter

w = size(I, 1);
h = size(I, 2);

imshow(I);
hold on;
for i = 1 : length(theta)
    if abs(theta(i)) > pi/4
        y1 = 0;
        y2 = w;
        x1 = (rho(i) - y1 .* sin(theta(i))) ./ cos(theta(i));        
        x2 = (rho(i) - y2 .* sin(theta(i))) ./ cos(theta(i));
    else
        x1 = 0;
        x2 = h;
        y1 = (rho(i) - x1 .* cos(theta(i))) ./ sin(theta(i));        
        y2 = (rho(i) - x2 .* cos(theta(i))) ./ sin(theta(i));
    end
    [x1 y1 x2 y2];
    plot([x1, x2], [y1, y2], 'g');
end
hold off;
