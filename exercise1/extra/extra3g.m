% Generalized Histogram Thresholding
% It performs maximum a posteriori estiamtion of a mixture of Gaussians to 
% optimally threshold each pixel. Show the compariston between Otsu and GHT 
% in your results.

clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 16;

A = rgb2gray(imread('bird.jpg'));

tresh_otsu = otsu(A)
tresh_GHT = GHT(A)
[H, bins]= myhist(A, 255);

A_otsu = A > tresh_otsu;
A_GHT = A > tresh_GHT;

rows = 3;
figure;
subplot(rows,2,1);
imagesc(A);


subplot(rows,2,2);
imagesc(A>51); % manually set treshold, from assignment2 a

colormap gray;

subplot(rows,2,3); 
bar(H); 
hold on;
line([tresh_otsu tresh_otsu], [0 0.1], 'color', 'r');
colormap gray; title('Otsu');

subplot(rows,2,4); 
bar(H);
hold on;
line([tresh_GHT tresh_GHT], [0 0.1], 'color', 'g');
colormap gray; title('GHT');

subplot(rows,2,5);
imagesc(A_otsu); title('A\_otsu');

subplot(rows,2,6);
imagesc(A_GHT); title('A\_GHT');

% We see a better treshold with GHT amd therefore a better mask.
