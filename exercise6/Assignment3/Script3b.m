tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

I = im2gray(imread('../faces/1/001.png'));
size(I);

% Data preparation
series = 1;
A = prepare_data(series);

[U,Mu] = dual_pca(A);
U_5 = U(:, 1:5);

for i = 1:5
    I1 = reshape(U(:, i), [96, 84]);
    subplot(1, 5, i);
    imagesc(I1); axis square;
end;
% those are the best features of hte face

colormap gray;

figure;
subplot(2,2,1);
imshow(I); title('Original image'); 

[h,w] = size(I);
I_vector = reshape(I,[h*w,1]); % create 1D vector from an image
I_vector_dot = I_vector;
I_vector_dot(4074,1) = 0;

subplot(2,2,2);
imshow(uint8(reshape(I_vector_dot,[h,w]))); title('Dot image'); 

y = project(I_vector_dot, U, Mu);
x = reconstruct(y, U, Mu);
I_reconstructed = uint8(reshape(x,[h,w]));

subplot(2,2,3);
imshow(I_reconstructed); title('Reconstructed dot image');

y = project(I_vector, U, Mu);
y(2) = 0; % largest weight

x = reconstruct(y, U, Mu);
I_reconstructed1 = uint8(reshape(x,[h,w]));

subplot(2,2,4);
imshow(I_reconstructed1); title('Reconstructed img with 2nd element y = 0');


diffMatrix = (I~=I_reconstructed);

figure;
imshow(diffMatrix); title('Pixels that changed after reconstructing image with dot on nose');

diffelements=sum(I~=I_reconstructed);
result= diffelements/numel(I);
fprintf('Number of pixels changed in dot: %0.f\n', sum(diffelements)); 

diffelements1=sum(I~=I_reconstructed1);
result1= diffelements1/numel(I);
fprintf('Number of pixels changed in y(2) = 0: %0.0f \n\n', sum(diffelements1)); 



toc;