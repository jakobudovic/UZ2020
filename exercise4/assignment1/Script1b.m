tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;


A = imread('../graf/graf1.jpg');
A_gray = rgb2gray(A);

sigma = 3;
thresh = 2000;
[x1, y1, A1] = harris_points(A_gray, sigma, thresh);
H1 = insertMarker(A_gray,[x1,y1],'x','color','red','size', 5);

sigma = 6;
[x2, y2, A2] = harris_points(A_gray, sigma, thresh);
H2 = insertMarker(A_gray,[x2,y2],'x','color','red','size', 5);

sigma = 9;
[x3, y3, A3] = harris_points(A_gray, sigma, thresh);
H3 = insertMarker(A_gray,[x3,y3],'x','color','red','size', 5);

rows = 2;
cols = 3;

figure;
subplot(rows, cols, 1); imagesc(A1); 
axis equal; axis tight; title('Hessian \sigma = 3');

subplot(rows, cols, 2); imagesc(A2); 
axis equal; axis tight; title('Hessian \sigma = 6');

subplot(rows, cols, 3); imagesc(A3); 
axis equal; axis tight; title('Hessian \sigma = 9');


subplot(rows, cols, 4); imagesc(H1); 
axis equal; axis tight; title('');

subplot(rows, cols, 5); imagesc(H2); 
axis equal; axis tight; title('');

subplot(rows, cols, 6); imagesc(H3); 
axis equal; axis tight; title('');
colormap gray;

toc;