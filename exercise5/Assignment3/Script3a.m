tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

house_points = load('../epipolar/house_points.txt');
cam_cal_left = load('../epipolar/house1_camera.txt');
cam_cal_right = load('../epipolar/house2_camera.txt');

% left and right hosues
IL = rgb2gray(imread('../epipolar/house1.jpg'));
IR = rgb2gray(imread('../epipolar/house2.jpg'));

% convert to homogeneous coordinates, last column is 1
x1 = house_points(:,1:2)';
x1(3,:) = 1;

x2 = house_points(:,3:4)';
x2(3,:) = 1;

X = triangulate(x1, x2, cam_cal_left, cam_cal_right);

subplot(1, 3, 1);
imshow(IL); title('Left image');
hold on
plot(house_points(:,1),house_points(:,2),'r+');

subplot(1, 3, 2);
imshow(IR); title('Right image');
hold on
plot(house_points(:,3),house_points(:,4),'r+');
hold off

subplot(1, 3, 3);
show_triangulation(X)

toc;