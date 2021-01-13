tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

% pairs
% P = load('../newyork/newyork.txt');
I1 = double(im2gray(imread('../newyork/newyork1.jpg')));
I2 = double(im2gray(imread('../newyork/newyork2.jpg')));

% P = load('../graf/graf.txt');
% I1 = double(rgb2gray(imread('../graf/graf1.jpg')));
% I2 = double(rgb2gray(imread('../graf/graf2.jpg')));

P = find_matches(I1,I2);
P1 = sortrows(Px = [];,5);
P = P1(1:10, :);
% P = P(:,1:4); % remove last column (distance)

% homography matrix
H = estimate_homography(P(:,1),P(:,2),P(:,3),P(:,4));

% first image transformed with the homography matrix H
I1_T = transform_homography(I1, H);

displaymatches(I1,P(:,1),P(:,2),I2,P(:,3),P(:,4));

rows = 1;
cols = 3;
figure;
subplot(rows, cols, 1); imagesc(I1); 
axis equal; axis tight; title('I1');

subplot(rows, cols, 2); imagesc(I2); 
axis equal; axis tight; title('I2');

subplot(rows, cols, 3); imagesc(I1_T); 
axis equal; axis tight; title('I1_T');


colormap gray;
toc;
