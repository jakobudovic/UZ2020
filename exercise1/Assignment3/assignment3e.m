I = imread('coins.jpg'); % Load a synthetic mask
% Compute mask M and clean it using morphological operations
I_GRAY = rgb2gray(I);

tresh = otsu(I_GRAY)
A = I_GRAY > tresh; % mask, we flip the values
A = ~A;

SE = ones(20); % 3x3 structuring element
A1 = imdilate(A, SE);
A2 = imerode(A1, SE);

% we put in grayscale original image to get values in histogram
[H, bins]= myhist(I_GRAY, 255);

L = bwlabel(A2); % Use connected components algorithm to label all components
L1 = L;

label_max = max(L1(:)); % A trick to get all values present in matrix L
for i = 1:label_max
    if sum(L1(:) == i) < 700 % Only process labels that have more than 700 pixels
    % if i ~= 7 % select which labeled picture you want to see
        L1(L1 == i) = 0;
    else
        i
    end;
end;


rows = 4;
cols = 3;
figure;

subplot(rows,cols,1);
imagesc(I); axis equal; axis tight; title('Original');

subplot(rows,cols,2);
imagesc(I_GRAY); axis equal; axis tight; title('Gray img');

subplot(rows,cols,3);
imagesc(A); axis equal; axis tight; title('Mask');

subplot(rows,cols,4);
bar(H); title('Histogram of gray values');

subplot(rows,cols,5);
imagesc(A2); axis equal; axis tight; title('Mask');

subplot(rows,cols,6);
imagesc(L); axis equal; axis tight; title('Bwlabel');

subplot(rows,cols,7);
imagesc(L1); axis equal; axis tight; title('Bwlabel filtered');

subplot(rows,cols,8);
imshow(I); title('Original');

subplot(rows,cols,9);
imshow(immask(I, L > 0)); title('Processed'); % Display the result (if you have not written immask←-
% function then simply display the mask)


colormap gray;