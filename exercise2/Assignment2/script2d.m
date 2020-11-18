clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

kernelID = fopen('kernel.txt','r');
formatSpec = '%f';
g = fscanf(kernelID,formatSpec);

s1 =  0.5;
s2 = 1.0;
s3 = 2.0;
s4 = 3.0;
s5 = 4.0;
[k1, x1] = gauss(s1);
[k2, x2] = gauss(s2);
[k3, x3] = gauss(s3);
[k4, x4] = gauss(s4);
[k5, x5] = gauss(s5);

figure;

subplot(2,1,1);
hold on;
plot(x1, k1 , 'b');
plot(x2, k2, 'g');
plot(x3, k3, 'c');
plot(x4, k4, 'k');
plot(x5, k5, 'R');
hold off;
title('custom function');
legend('sigma = 0.5', 'sigma = 1.0', 'sigma = 2.0', 'sigma = 3.0', 'sigma = 4.0');

subplot(2,1,2);
hold on;
plot(1:13,g, 'g');
hold off;
title('custom function');
legend('custom function');



