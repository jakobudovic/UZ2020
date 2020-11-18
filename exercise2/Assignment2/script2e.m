clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

signalID = fopen('signal.txt','r');
kernelID = fopen('kernel.txt','r');
formatSpec = '%f';
signal = fscanf(signalID,formatSpec);
g = fscanf(kernelID,formatSpec);

s = 2.0;
[k1, x] = gauss(s);
k2 = [0.1, 0.6, 0.4];

s1 = conv(signal, k1);
s1 = conv(s1, k2);

s2 = conv(signal, k2);
s2 = conv(s2, k1);

s3 = conv(k1, k2);
s3 = conv(signal, s3);


figure;
subplot(1,4,1);
plot(1:length(signal), signal);
title('s');

subplot(1,4,2);
plot(1:length(s1), s1);
title('(s*k1)*k2');

subplot(1,4,3);
plot(1:length(s2), s2);
title('(s*k2)*k1');

subplot(1,4,4);
plot(1:length(s3), s3);
title('s(k1*k2)');


