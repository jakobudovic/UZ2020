clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

I = rgb2gray(imread('../data/museum.jpg'));

sigma = 1.0;
[Ix, Iy] = image_derivatives(I, sigma);
[Ixx, Iyy, Ixy] = image_derivatives2(I,sigma);
[Imag, Idir] = gradient_magnitude(I, sigma);

rows = 2;
cols = 4;
figure;
colormap gray; 

subplot(rows, cols, 1); imagesc(I); 
axis equal; axis tight; title('Original');

subplot(rows, cols, 2); imagesc(Ix); 
axis equal; axis tight; title('Ix');

subplot(rows, cols, 3); imagesc(Iy); 
axis equal; axis tight; title('Iy');

subplot(rows, cols, 4); imagesc(Imag); 
axis equal; axis tight; title('ImaG');

subplot(rows, cols, 5); imagesc(Ixx);
axis equal; axis tight; title('Ixx');

subplot(rows, cols, 6); imagesc(Ixy); 
axis equal; axis tight; title('Ixy');

subplot(rows, cols, 7); imagesc(Iyy); 
axis equal; axis tight; title('Iyy');

subplot(rows, cols, 8); imagesc(Idir); 
axis equal; axis tight; title('Idir');

