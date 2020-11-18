% read an image
A = imread('umbrellas.jpg'); % Image A is in 8-bit format (uint8)
Ad = double(A);
% convert to grayscale
A_gray = (Ad(:,:,1) + Ad(:,:,2) + Ad(:,:,3)) / 3.0;

% new factor, 63/255 = 0.24706. We multiply our image with it to get a new
% image in range of 0-63
A1 = uint8(A_gray * 0.23706);


figure;
% subplot(1,2,1);
imagesc(A1); 
colormap gray % USE THIS NEXT TIME because Matlab remembered settings from before !!!

% darker
figure;
% subplot(1,2,2);
imshow(A1);



help imagesc
% very little or almost no control over the displaying of the image.
% 
% doc imagesc % more info here


help imshow
% imshow(I) displays the grayscale image I.
% more customizable, viewing and changing axes,... 
% we can specify colormap, we have more controls [2D]x3 matrix

