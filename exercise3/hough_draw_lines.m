function hough_draw_lines(I, rho, theta)
% Draws the lines calculated by Hough transform to an image
%
% Input:
%  - I: image
%  - rho: displacement parameter
%  - theta: angle parameter

h = size(I, 1);
w = size(I, 2);

imshow(I);
hold on;
for i = 1 : length(theta)
    if abs(theta(i)) > pi/4
        x1 = 0;
        y1 = (rho(i) - x1 .* cos(theta(i))) ./ sin(theta(i));
        x2 = h;
        y2 = (rho(i) - x2 .* cos(theta(i))) ./ sin(theta(i));
    else
        y1 = 0;
        x1 = (rho(i) - y1 .* sin(theta(i))) ./ cos(theta(i));
        y2 = w;
        x2 = (rho(i) - y2 .* sin(theta(i))) ./ cos(theta(i));
    end
    plot([x1, x2], [y1, y2], 'g');
end
hold off;
