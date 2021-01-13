tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

F1 = load('../epipolar/house_fundamental.txt');
points = load('../epipolar/house_matches.txt');
I1 = im2gray(imread('../epipolar/house1.jpg'));
I2 = im2gray(imread('../epipolar/house2.jpg'));

x1 = [points(:, 1), points(:, 2)]';
x1(3, :) = 1;

x2 = [points(:, 3), points(:, 4)]';
x2(3, :) = 1;

[F, e1, e2, x1, x2] = ransac_fundamental(x1, x2, 5, 5000);

% select first point for calculationg its line
p1 = x1(1, :);
p1r = x2(1, :);
l1 = F * p1';

% get error for plotting result
[d, d1, d2] = reprojection_error(p1', p1r', F);

subplot(1,2,1);
imshow(I1); title('Inliers (red), Outliers (blue), Selected (green)');
hold on
plot(points(:,1),points(:,2),'bo', 'MarkerSize', 4);
plot(x1(:,1),x1(:,2),'r+');
plot(p1(1), p1(2),'g*');
hold off

subplot(1,2,2);
[h,w] = size(I2);
imshow(I2); title(['Inliers: ', num2str(size(x1,1)/size(points,1) * 100), '%, Error: ', num2str(d)]);
hold on

plot(points(:,3),points(:,4),'bo', 'MarkerSize', 4);
plot(x2(:,1),x2(:,2),'r+');
plot(p1r(2),p1r(2),'g*', 'MarkerSize', 4);
draw_line(l1,w,h,'g');
hold off

toc;