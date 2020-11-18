clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

A = imread('cat1.jpg');
B = imread('cat2.jpg');

% apply gaussian to the each RGB color separately
sigma = 3;
Ag_1 = gaussfilter(A(:,:,1), sigma);
Ag_2 = gaussfilter(A(:,:,2), sigma);
Ag_3 = gaussfilter(A(:,:,3), sigma);

% add all 3 dimensions back together
Ag(:,:,1) = Ag_1;
Ag(:,:,2) = Ag_2;
Ag(:,:,3) = Ag_3;



% ------- Picture 2 -----------
% use new function laplacian(2d IMG, sigma)
sigma1 = 30 
Bg_1 = laplacian(B(:,:,1), sigma1);
Bg_2 = laplacian(B(:,:,2), sigma1);
Bg_3 = laplacian(B(:,:,3), sigma1);

Bg(:, :, 1) = Bg_1;
Bg(:, :, 2) = Bg_2;
Bg(:, :, 3) = Bg_3;

rows = 2;
cols = 2;
figure;

subplot(rows, cols, 1); imshow(A); 
axis equal; axis tight; title('Cat1');

subplot(rows, cols, 2); imshow(B); 
axis equal; axis tight; title('Cat2');

subplot(rows, cols, 3); imshow(uint8(Ag)); 
axis equal; axis tight; title('Cat1 gaussian');

subplot(rows, cols, 4); imshow(uint8(Bg)); 
axis equal; axis tight; title('Cat2 laplacian');

figure;
% sum up those 2 images and normalize values by dividing them with 2
C = (Ag + Bg) ./ 2;
imshow(uint8(C)); 
axis equal; axis tight; title('Pictures combined');


