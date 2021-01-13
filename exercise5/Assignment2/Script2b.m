tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

F1 = load('../epipolar/house_fundamental.txt');
points = load('../epipolar/house_points.txt');
I1 = im2gray(imread('../epipolar/house1.jpg'));
I2 = im2gray(imread('../epipolar/house2.jpg'));
p = [85, 233, 1]';

[F, e1, e2] = fundamental_matrix(points(:, 1:2)', points(:, 3:4)');

% calculate the line in the second image from point (1) in left
l1 = F * p;

subplot(1,2,1);
imshow(I1); title('Left image');
hold on
plot(85,233,'g*');
plot(points(:,1),points(:,2),'ro');
hold off

subplot(1,2,2);
[h,w] = size(I2);
imshow(I2); title('Right image');
hold on
plot(67,219,'g*');
plot(points(:,3),points(:,4),'r+');
draw_line(l1,w,h,'g');
hold off

toc;
