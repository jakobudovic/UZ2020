clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

A = rgb2gray(imread('lena.png'));
Icg = imnoise(A,'gaussian', 0, 0.01); % Gaussian noise
figure;
subplot(2,2,1); imshow(Icg); colormap gray;
axis equal; axis tight; title('Gaussian noise');
Ics = imnoise(A,'salt & pepper', 0.1); % Salt & pepper noise
subplot(2,2,2) ; imshow(uint8(Ics)); colormap gray;
axis equal; axis tight; title('Salt and pepper');
Icg_b = gaussfilter(double(Icg), 1);
Ics_b = gaussfilter(double(Ics), 1);
subplot(2,2,3) ; imshow(uint8(Icg_b)); colormap gray;
axis equal; axis tight; title('Filtered') ;
subplot(2,2,4) ; imshow(uint8(Ics_b)); colormap gray;
axis equal; axis tight; title('Filtered');



