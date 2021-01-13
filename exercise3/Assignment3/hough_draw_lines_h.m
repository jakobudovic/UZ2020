function hough_draw_lines_h(I, rho, theta)
h = size(I, 1);
w = size(I, 2);
imshow(I);
hold on;
for i = 1 : length(theta)
    if abs(theta(i)) < pi/4
        x1 = 0;
        y1 = (rho(i) - x1 .* sin(theta(i))) ./ cos(theta(i));
        x2 = w;
        y2 = (rho(i) - x2 .* sin(theta(i))) ./ cos(theta(i));
    else
        y1 = 0;
        x1 = (rho(i) - y1 .* cos(theta(i))) ./ sin(theta(i));
        y2 = h;
        x2 = (rho(i) - y2 .* cos(theta(i))) ./ sin(theta(i));
    end
    plot([x1, x2], [y1, y2], 'g');
end
hold off;