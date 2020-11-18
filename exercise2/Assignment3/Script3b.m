clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

A = rgb2gray(imread('museum.jpg'));

B = imnoise(A,'gaussian', 0, 0.02); % Gaussian noise

figure;
subplot(2,2,1); imshow(A); colormap gray;
axis equal; axis tight; title('Original');

A_sharp = sharpenfilter(double(A));
B_sharp = sharpenfilter(double(B));


subplot(2,2,2) ; imshow(uint8(A_sharp)); colormap gray;
axis equal; axis tight; title('Sharpened Original');

subplot(2,2,3) ; imshow(B); colormap gray;
axis equal; axis tight; title('Filtered') ;

subplot(2,2,4) ; imshow(uint8(B_sharp)); colormap gray;
axis equal; axis tight; title('Filtered Sharpened');