tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

%               HOUSE                       %
% F1 = load('../epipolar/house_fundamental.txt');
% points = load('../epipolar/house_matches.txt');
% I1 = im2gray(imread('../epipolar/house1.jpg'));
% I2 = im2gray(imread('../epipolar/house2.jpg'));
% cam_cal_left = load('../epipolar/house1_camera.txt');
% cam_cal_right = load('../epipolar/house2_camera.txt');

%               LIBRARY                       %
points = load('../epipolar/library_matches.txt');
I1 = im2gray(imread('../epipolar/library1.jpg'));
I2 = im2gray(imread('../epipolar/library2.jpg'));
cam_cal_left = load('../epipolar/library1_camera.txt');
cam_cal_right = load('../epipolar/library2_camera.txt');


x1 = [points(:, 1), points(:, 2)]';
x1(3, :) = 1;

x2 = [points(:, 3), points(:, 4)]';
x2(3, :) = 1;

[F, e1, e2, x1_in, x2_in] = ransac_fundamental(x1, x2, 5, 5000);

X = triangulate(x1_in', x2_in', cam_cal_left, cam_cal_right);

subplot(1,3,1);
imshow(I1); title('Inliers (red), Outliers (blue), Selected (green)');
hold on
% plot(points(:,1),points(:,2),'bo', 'MarkerSize', 4);
plot(x1_in(:,1),x2_in(:,2),'r+', 'MarkerSize', 6);
% plot(p1(1), p1(2),'g*');
hold off

subplot(1,3,2);
[h,w] = size(I2);
imshow(I2); title(['Inliers: ', num2str(size(x1,1)/size(points,1) * 100)]);
hold on

% plot(points(:,3), points(:,4),'bo', 'MarkerSize', 4);
plot(x1_in(:,1),x2_in(:,2),'r+', 'MarkerSize', 6);
% plot(p1r(2),p1r(2),'g*', 'MarkerSize', 4);
% draw_line(l1,w,h,'g');
hold off

subplot(1,3,3);
show_triangulation(X)

toc;