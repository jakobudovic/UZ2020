tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

I1 = double(im2gray(imread('../disparity/office2_left.png')));
I2 = double(im2gray(imread('../disparity/office2_right.png')));

I1 = imresize(I1, 0.5);
I2 = imresize(I2, 0.5);

rows = 1;
cols = 3;  
figure;
subplot(rows, cols, 1); imagesc(I1); 
axis equal; axis tight; title('I1');

subplot(rows, cols, 2); imagesc(I2); 
axis equal; axis tight; title('I2');


colormap gray;

toc;