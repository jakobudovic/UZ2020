tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;


A = double(rgb2gray(imread('../graf/graf1_small.jpg')));
B = double(rgb2gray(imread('../graf/graf2_small.jpg')));

M = find_matches(A,B);
displaymatches(A,M(:,1),M(:,2),B,M(:,3),M(:,4));

toc;