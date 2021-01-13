tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

% Data preparation
series = 2;
A = prepare_data(series);

[U,Mu] = dual_pca(A);

Elephant = im2gray(imread('../elephant.jpg'));

Elephant_vec = reshape(Elephant,[84*96,1]);

subplot(1,2,1);
imshow(Elephant); title('elephant'); 

% project elephant image to PCA and back to image space
y = project(Elephant_vec, U, Mu);
x = reconstruct(y, U, Mu);
x = reshape(x, [96,84]);

subplot(1,2,2);
imshow(uint8(x)); title('elephant on faces'); 
% colormap gray;



toc;