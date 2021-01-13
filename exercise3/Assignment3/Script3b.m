tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;


rows = 1;
cols = 3;

% --- 2 points ---
E = zeros(100); % 100 x 100 pixel image
E(10, 10) = 1;
E(20, 20) = 1; % Set threshold to 2 to obtain line that travels through both points.
threshold = 2;
[out_ro, out_theta, I1, I2] = hough_find_lines(E, 400, 200, threshold);

I3 = I2;

figure; 
subplot(rows, cols, 1); imagesc(I1);
subplot(rows, cols, 2); imagesc(I2);
subplot(rows, cols, 3); imagesc(E);

hough_draw_lines_h(E, out_ro, out_theta);

title('2 points');

% --- oneline ---

sigma = 1.0;
theta = 1;
threshold = 200;
A = rgb2gray(imread('../data/oneline.png'));
A1 = findedges(A, sigma, theta);    
[out_ro1, out_theta1, I1, I2] = hough_find_lines(A1, 300, 170, threshold);

I3 = I2;

figure;
subplot(rows, cols, 1); imagesc(I1);
subplot(rows, cols, 2); imagesc(I2);
subplot(rows, cols, 3); imagesc(A);

hough_draw_lines_h(A, out_ro1, out_theta1);


% subplot(rows, cols, 3); imagesc(A);
title('oneline');
 
 
% --- rectangle ---
sigma = 1.0;
theta = 11;
threshold = 201;
B = rgb2gray(imread('../data/rectangle.png'));
B1 = findedges(B, sigma, theta);
[out_ro2, out_theta2, I1, I2] = hough_find_lines(B1, 300, 170, threshold);

I3 = I2;

figure;
subplot(rows, cols, 1); imagesc(I1);
subplot(rows, cols, 2); imagesc(I2);
subplot(rows, cols, 3); imagesc(B);
hough_draw_lines_h(B, out_ro2, out_theta2);

title('rectangle');

toc;