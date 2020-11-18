% a)
A = imread('umbrellas.jpg'); % Image A is in 8-bit format (uint8)
% figure(1); clf; imagesĐc(A); % open figure window, clear, draw
% figure(2); clf; imsshow(A);
[ h, w, d ] = size(A)

% b)
Ad = double(A); % division operation not defined for uint8
[h,w,d] = size(A) % output the size of the image (notice the absence of semicolon at the end of ←-
% the line)
A_gray = uint8((Ad(:,:,1) + Ad(:,:,2) + Ad(:,:,3)) / 3.0);
% figure; imshow(A_gray); % change image to 8-bit
% colormap jet

% c)
A1 = A; 
A1(130:260,240:450,3) = 0 ;
% figure;
% subplot(1,2,1);
% imshow(A1);
A2 = A(130:260,240:450, 1);
% subplot(1,2,2); 
% imshow(A2);

% d)
A3 = A_gray; % we created gray image before
A3(130:260,240:450) = 255 - A3(130:260,240:450) ;
figure;
subplot(1,2,1);
imshow(A3);
A4 = 255 - A3; % we invert the gray image
subplot(1,2,2);
imshow(A4);

