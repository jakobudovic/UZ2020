clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

Igray = rgb2gray(imread('../data/museum.jpg'));
I = imread('../data/museum.jpg');

figure;
bins = 8;
H_ = myhist3_(I, bins);

% direction and gradient of the image
sigma = 1.0;
[Imag, Idir] = gradient_magnitude(Igray, sigma);
H_grad = myhist3_grad(Imag, Idir, bins);

cols = 2;
rows = 3;

subplot(rows, cols, 1);
imagesc(I);

subplot(rows, cols, 2);
H1 = squeeze(sum(H_,1));
bar3(H1); xlabel('green'); ylabel('blue');

subplot(rows, cols, 3);     
bar3(squeeze(sum(H_,2))); xlabel('red'); ylabel('blue');

subplot(rows, cols, 4);
bar3(squeeze(sum(H_,3))); xlabel('red'); ylabel('green');

subplot(rows, cols, 5);
bar3(squeeze(sum(H_,3))); xlabel('magnitude'); ylabel('direction');
colormap(jet);



