tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;


rows = 3;
cols = 2;
num_lines = 20;

% --- bricks ---------------------------------

sigma = 8.0;
theta = 4;
threshold = 220;
A_ = imread('../data/bricks.jpg');
A = rgb2gray(A_);
A1 = findedges(A, sigma, theta);    
[out_ro, out_theta, I1, I2] = hough_find_lines_f(A1, 800, 170, threshold);

I3 = I2;

figure;
subplot(rows, cols, 1); imagesc(A); title('original');
subplot(rows, cols, 2); imagesc(A1); title('edges');
subplot(rows, cols, 3); imagesc(I1); title('I1');
subplot(rows, cols, 4); imagesc(I2); title('I2');
subplot(rows, cols, 5); imagesc(I2); 

[out_ro_sorted, idx] = sort(out_ro,'descend');
out_theta_sorted = out_theta(idx);

if length(length(out_ro_sorted)) < num_lines
    hough_draw_lines_h(A_,out_ro_sorted,out_theta_sorted);
else
    hough_draw_lines_h(A_,out_ro_sorted(1:num_lines),out_theta_sorted(1:num_lines));
end;
% hough_draw_lines_h(A_, out_ro, out_theta);
title('I2');

% --- pier ------------------------------------

sigma = 15.0;
theta = 1;
threshold = 130;
A_ = imread('../data/pier.jpg');
A = rgb2gray(A_);
A1 = findedges(A, sigma, theta);    
[out_ro, out_theta, I1, I2] = hough_find_lines_f(A1, 800, 170, threshold);

I3 = I2;

figure;
subplot(rows, cols, 1); imagesc(A); title('original');
subplot(rows, cols, 2); imagesc(A1); title('edges');
subplot(rows, cols, 3); imagesc(I1); title('I1');
subplot(rows, cols, 4); imagesc(I2); title('I2');
subplot(rows, cols, 5); imagesc(A_); 


[out_ro_sorted, idx] = sort(out_ro,'descend');
out_theta_sorted = out_theta(idx);
hough_draw_lines_h(A_,out_ro_sorted(1:num_lines),out_theta_sorted(1:num_lines));
% hough_draw_lines_h(A_, out_ro, out_theta);
title('pier');

%}
toc;