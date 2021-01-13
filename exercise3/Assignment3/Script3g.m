tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;


A = imread('../data/rectangle.png');
A_gray = rgb2gray(A);

sigma = 1.0;
theta = 11;
[B,Idir] = findedges_g(A_gray,1,8);


threshold = 201;
[rhos,thetas] = hough_find_lines_g(B,Idir,300,170,threshold);

figure;
hough_draw_lines(A,rhos,thetas);



toc;