clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

A = imread('umbrellas.jpg');

figure;
bins = 8;
H = myhist3(A, bins);
subplot(2,2,1);
imagesc(A);

subplot(2,2,2);
bar3(squeeze(sum(H,1))); xlabel('green'); ylabel('blue');

subplot(2,2,3);     
bar3(squeeze(sum(H,2))); xlabel('red'); ylabel('blue');

subplot(2,2,4);
bar3(squeeze(sum(H,3))); xlabel('red'); ylabel('green');
colormap(jet);


%{
bar3();
subplot(2,2,3);

bar3();
subplot(2,2,4);

%}
