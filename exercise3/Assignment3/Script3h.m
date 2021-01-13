tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;


rows = 3;   
cols = 2;
num_lines = 20;


A = imread('../data/eclipse.jpg');
A_gray = rgb2gray(A);

[B] = findedges(A_gray,1,10);

imshow(B); title('edges');

figure;

radius = 48;
[x,y] = hough_find_circles(B, 180,radius, 50);
x = x - 10;
hough_draw_circles(A,x,y,radius * ones(length(x)));


toc;