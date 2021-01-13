tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

T = 120; % mm, camera baseline
f = 2.5; % mm, focal length 
z = linspace(1,100);

d = (f * T) ./ z;

plot(z,d);

toc;