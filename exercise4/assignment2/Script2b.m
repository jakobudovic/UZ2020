tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;


A = double(rgb2gray(imread('../graf/graf1_small.jpg')));
B = double(rgb2gray(imread('../graf/graf2_small.jpg')));

sigma = 6;
thresh = 5000;

[x1, y1, A1] = harris_points(A, sigma, thresh);
[x2, y2, A2] = harris_points(B, sigma, thresh);

m = 41;
sigma = 1;
bins = 16;

D1 = descriptors_maglap(A, x1, y1, m, sigma, bins);
D2 = descriptors_maglap(B, x2, y2, m, sigma, bins);

[indices, distances] = find_correspondences(D1, D2);
displaymatches(A,x1,y1,B,x2(indices),y2(indices));

colormap gray;

toc;