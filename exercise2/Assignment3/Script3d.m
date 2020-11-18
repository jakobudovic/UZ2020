clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

A = rgb2gray(imread('lena.png'));
Icg = imnoise(A,'gaussian', 0, 0.01); % Gaussian noise

rows = 2;
cols = 3;
figure;
subplot(rows, cols, 1); imshow(Icg); colormap gray;
axis equal; axis tight; title('Gaussian noise');
Ics = imnoise(A,'salt & pepper', 0.01); % Salt & pepper noise

% filtrer with gaussian filter
Icg_b = gaussfilter(double(Icg), 1);
Ics_b = gaussfilter(double(Ics), 1);

% filtrer with median filter
width = 3;  
Icg_c = mediann(Icg, width);
Ics_c = mediann(Ics, width);


subplot(rows, cols, 2) ; imshow(uint8(Icg_b)); colormap gray;
axis equal; axis tight; title('Gauss Filtered') ;
subplot(rows, cols, 3) ; imshow(uint8(Icg_c)); colormap gray;
axis equal; axis tight; title('Median Filtered') ;

subplot(rows, cols, 4) ; imshow(uint8(Ics)); colormap gray;
axis equal; axis tight; title('Salt and pepper');
subplot(rows, cols, 5) ; imshow(uint8(Ics_b)); colormap gray;
axis equal; axis tight; title('Gauss Filtered');
subplot(rows, cols, 6) ; imshow(uint8(Ics_c)); colormap gray;
axis equal; axis tight; title('Median Filtered');



%{
(n-w)^2 * w * log(w)

n is image size
w is kernel size
w * log(w) is quicksort

%}