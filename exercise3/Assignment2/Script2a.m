tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;


I = rgb2gray(imread('../data/museum.jpg'));

sigma = 1.0;
theta = 23;
Ie = findedges(I, sigma, theta);

figure;
colormap gray;

rows = 1;
cols = 2;
subplot(rows, cols, 1); imagesc(I); 
axis equal; axis tight; title('Original');

subplot(rows, cols, 2); imagesc(Ie); 
axis equal; axis tight; title('Edges');


toc;