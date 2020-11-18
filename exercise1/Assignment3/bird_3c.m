IMG = imread('bird.jpg');
IMG_GRAY = rgb2gray(IMG);
SE = ones(20); % 3x3 structuring element
SE1 = ones(20); % 3x3 structuring element

tresh = otsu(IMG_GRAY); % obtaining treshold with otsu's method
A1 = IMG_GRAY > tresh; % tresholded image

A2 = A1;
DIL = imdilate(A2, SE);
A2 = imerode(DIL, SE1);

% A2 stores our mask

[X, Y, Z, C] = immask(IMG, A2);

rows = 4;
cols = 2;

figure;

subplot(rows,cols,1);
imagesc(IMG_GRAY); axis equal; axis tight; title('Original');

subplot(rows,cols,2);
imagesc(X); axis equal; axis tight; title('Red');

subplot(rows,cols,3);
imagesc(Y); axis equal; axis tight; title('Green');

subplot(rows,cols,4);
imagesc(Z); axis equal; axis tight; title('Blue');

subplot(rows,cols,5);
imagesc(A1); axis equal; axis tight; title('Treshold');

subplot(rows,cols,6);
imagesc(A2); axis equal; axis tight; title('Closing function, "mask"');

subplot(rows,cols,7);
imagesc(IMG); axis equal; axis tight; title('Original image');

subplot(rows,cols,8);
imagesc(C); axis equal; axis tight; title('Final image');



colormap gray;


MTX = [[1,2,3],[4,5,6],[7,8,9]];
