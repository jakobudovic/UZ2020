tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

I = im2gray(imread('../faces/1/001.png'));
size(I);

% Data preparation
% which dir to use
series = 1;
A = prepare_data(series);

toc;