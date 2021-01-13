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

[M1, M2, indexPairs] = find_matches(I1, I2);
m1 = M1';
m2 = M2';
m1(3, :) = 1;
m2(3, :) = 1;

[F, e1, e2, x1, x2] = ransac_fundamental(m1, m2, 5, 5000);
Goldpass1
% select first point for calculationg its line
p1 = x1(1, :);
p1r = x2(1, :);
l1 = F * p1';
% get error for plotting result
[d, d1, d2] = reprojection_error(p1', p1r', F);

figure;
subplot(1,2,1);
imshow(I1);
hold on
plot(M1(:,1),M1(:,2),'bo', 'MarkerSize', 4);
hold off;

subplot(1,2,2);
imshow(I1); title(['Correspodence: ', num2str(size(x1, 1) / size(M1, 1)), '%, Reprojection error: ', num2str(d)]);
hold on
plot(x1(:,1),x1(:,2),'r+');
% plot(M2(:,1),M2(:,2),'bo', 'MarkerSize', 4);
hold off;


toc;