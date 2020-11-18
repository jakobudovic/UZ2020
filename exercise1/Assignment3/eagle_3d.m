IMG = imread('eagle.jpg');
IMG_GRAY = rgb2gray(IMG);
SE = ones(15); % 3x3 structuring element

tresh = otsu(IMG_GRAY);
A = IMG_GRAY > tresh;

EROD = imerode(A, SE);
A1 = imdilate(EROD, SE);
% A1 = imerode(DIL, SE1);

% inverted mask
A2 = ~A1;

[X, Y, Z, B] = immask(IMG, A2); 

rows = 3;
cols = 2;

figure;

subplot(rows,cols,1);
imagesc(IMG); axis equal; axis tight; title('Original');

subplot(rows,cols,2);
imagesc(IMG_GRAY); axis equal; axis tight; title('Grey');

subplot(rows,cols,3);
imagesc(A); axis equal; axis tight; title('Mask');

subplot(rows,cols,4);
imagesc(A1); axis equal; axis tight; title('Mask closed');

subplot(rows,cols,5);
imagesc(B); axis equal; axis tight; title('Mask');

colormap gray;
