tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

A = load('points.txt');
% dual_pca_demo();
[U,Mu] = dual_pca(A);

toc;