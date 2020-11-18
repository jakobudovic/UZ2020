clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

A = imread('object_01_1.png');

B = imread('object_02_1.png');

C = imread('object_03_1.png');

% myhist3

nbins = 8;
A1 = myhist3(A, nbins);
B1 = myhist3(B, nbins);
C1 = myhist3(C, nbins);

figure;
% colormap(jet);

subplot(2,3,1);
imagesc(A);

subplot(2,3,2);
imagesc(B);

subplot(2,3,3);
imagesc(C);

h1 = reshape(A1, [], 1);
h2 = reshape(B1, [], 1);
h3 = reshape(C1, [], 1);
distance_type = 'l2'; % l2, chi2, hellinger, intersect
        
subplot(2,3,4);
dist1 = compare_histograms(h1, h1, distance_type);
bar(h1, 'BarWidth', 5.0); title('L2(H1, H1) = ', dist1);

subplot(2,3,5);
dist2 = compare_histograms(h1, h2, distance_type);
bar(h2, 'BarWidth', 5.0); title('L2(H1, H2) = ', dist2);

subplot(2,3,6);
dist3 = compare_histograms(h1, h3, distance_type);  
bar(h3 , 'BarWidth', 5.0); title('L2(H1, H3) = ', dist3);


%{

Probably black color
Lower the distance, more similar the images are.
So, based on L2 distance, image 3 is more similar to the image 1.
Other distances had similar result, yet a bit worse.

%}
