clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

fileID = fopen('signal.txt','r');
kernelID = fopen('kernel.txt','r');
formatSpec = '%f';
I = fscanf(fileID,formatSpec);
g = fscanf(kernelID,formatSpec);


Ig1 = simple_convolution(I, g);
Ig2 = conv(I, g, 'same'); % built in function

% For example, conv(u,v,'same') returns only the central part of the
% convolution, the same size as u, and conv(u,v,'valid') returns only 
% the part of the convolution computed without the zero-padded edges.

figure;

subplot(2,1,1);
plot(1:40,I, 'b');
hold on;
plot(1:13,g, 'g');
plot(1:40,Ig1, 'r');
hold off;
title('custom function');
legend('Original','Kernel', 'Result');

subplot(2,1,2);
plot(1:40,I, 'b');
hold on;
plot(1:13,g, 'g');
plot(1:40,Ig2, 'r');
hold off;
title('built in function');
legend('Original','Kernel', 'Result');



