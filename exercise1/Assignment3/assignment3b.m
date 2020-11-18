A = rgb2gray(imread('bird.jpg'));
SE = ones(20); % 3x3 structuring element
SE1 = ones(20); % 3x3 structuring element


tresh = otsu(A);
A1 = A > tresh;

figure;
subplot(3,2,1);
imagesc(A);

subplot(3,2,2);
imagesc(A1);

subplot(3, 2, 3);
imagesc(imerode(A1, SE)); axis equal; axis tight; title('Erode');

subplot(3, 2, 4);
imagesc(imdilate(A1, SE)); axis equal; axis tight; title('Dilate');


subplot(3, 2, 5);
DIL = imdilate(A1, SE);
A2 = imerode(DIL, SE1);

imagesc(A2); axis equal; axis tight; title('Dilate & Erode Looped');
% imagesc(imerode(imdilate(imerode(imdilate(A1,SE),SE1), SE), SE1)); axis equal; axis tight; title('Dilate & Erode');

subplot(3, 2, 6);
imagesc(imdilate(imerode(A1, SE), SE1)); axis equal; axis tight; title('Erode & Dilate');


colormap gray;
