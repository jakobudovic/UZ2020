clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

x = [zeros(1, 14), ones(1, 11), zeros(1, 15)]; % Input signal
xc = x; xc(11) = 5; xc(18) = 5; % Corrupted signal
figure;
subplot(1, 4, 1); plot(x); axis([1, 40, 0, 7]); title('Input');
subplot(1, 4, 2); plot(xc); axis([1, 40, 0, 7]); title('Corrupted');
g = gauss(1);
x_g = conv(xc, g, 'same');
x_m = simple_median(xc, 5);'
subplot(1, 4, 3); plot(x_g); axis([1, 40, 0, 7]); title('Gauss');
subplot(1, 4, 4); plot(x_m); axis([1, 40, 0, 7]); title('Median');