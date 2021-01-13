tic;
clc; % Clear command window.
clear; % Delete all variables.
close all;  % Close all figure windows except those created by imtool.
imtool close all;  % Close all figure windows created by imtool.
fontSize = 12;

I = im2gray(imread('../faces/2/024.png'));

% Data preparation
series = 2;
A = prepare_data(series);

[U,Mu] = dual_pca(A);


I_vector = reshape(I,[84*96,1]);

subplot(1,10,1);
imshow(I); title('1'); 

retain = 32;
for i = 1:6
    y = project(I_vector, U, Mu);
    U_new = U;
    U_new(:,retain:end) = 0;
    x = reconstruct(y, U_new, Mu);
    x = reshape(x, [96,84]);
    subplot(1,7,i+1);
    colormap gray;
    imagesc(uint8(x)); axis tight;
    title(['vectors retained: ' num2str(retain) ]);
    retain = retain / 2;
end

subplot(1,6,1);
imagesc(I); axis tight; title('original image');
colormap gray;

toc;