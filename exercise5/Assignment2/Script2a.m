tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

F = load('../epipolar/house_fundamental.txt');

row = 120;
col = 300;

x1 = [col, row, 1]';
x2 = [300, 170, 1]';

l1 = F * x1;
l2 = F * x2;

l1' * x1
x1' * l1


l1(1) * x1(1);
l1(2) * x1(2);
l1(3) * x1(3);

l2' * x2;
% x1 * l1

toc;


