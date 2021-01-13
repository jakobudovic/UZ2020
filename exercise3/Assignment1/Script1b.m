clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

% our image impulse
impulse = zeros(25,25) ; impulse(13,13) = 255;

sigma = 6.0;
[G, x1] = gauss(sigma);
[D, x2] = gaussdx(sigma);

A = conv2(conv2(impulse, G, 'full'), G', 'full'); % full is default and therefore not necessary
B = conv2(conv2(impulse, G), D');
C = conv2(conv2(impulse, D), G');
D_ = conv2(conv2(impulse, G'), D);
E = conv2(conv2(impulse, D'), G);

rows = 2; 
cols = 3;
figure;
colormap gray;

subplot(rows, cols, 1); imagesc(impulse); 
axis equal; axis tight; title('impulse');

subplot(rows, cols, 4); imagesc(A); 
axis equal; axis tight; title('G,Gt');

subplot(rows, cols, 2); imagesc(B); 
axis equal; axis tight; title('G,Dt');

subplot(rows, cols, 3); imagesc(C); 
axis equal; axis tight; title('D,Gt');

subplot(rows, cols, 5); imagesc(D_);
axis equal; axis tight; title('Gt,D');

subplot(rows, cols, 6); imagesc(E); 
axis equal; axis tight; title('Dt,G');