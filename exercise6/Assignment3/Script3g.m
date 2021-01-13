tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

I = im2gray(imread('../faces/2/024.png'));
I_vec  = reshape(I,[84*96,1]);

% Data preparation
A = prepare_data(1);
B = prepare_data(2);
C = prepare_data(3);

X = [A, B, C]; % 64 columns for each group of images, total 192

% perform PCA on X to find non-degenerated subspace
% [U1,Mu1] = dual_pca(B);
[U,Mu] = dual_pca(X);

% project all data (images) to the subspace U
% 8064x192' * (8064x192 - 8064x1) = 192x192
% 192x8064 * (8064x192) = 192x192
y = U(:, :)' * (double(X) - Mu); 

% get first 2 eigentvectors for visualization on 2D PCA subspace
U1 = U(:,1:2);
y1 = U1' * (double(X) - Mu);

% perform LDA on the projected data
[W,Ms] = lda(y,3,64); % Linear discriminant analysis

% project points in PCA subspace to LDA subspace using W
z = y * W;
z = z';

figure;
plot(y1(1,1:64), y1(2,1:64), 'r+')
hold on;
plot(y1(1,64:128), y1(2,64:128), 'g+')
plot(y1(1,128:192), y1(2,128:192), 'b+')
hold off;

figure;
plot(z(1,1:64), z(2,1:64), 'r+')
hold on
plot(z(1,64:128), z(2,64:128), 'g+')
plot(z(1,128:192), z(2,128:192), 'b+')
hold off;


toc;