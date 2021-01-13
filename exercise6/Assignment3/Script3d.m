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

% Average image from the series
Avg_vec = mean(A,2);
Avg_img = reshape(Avg_vec,[96,84]);
figure;
imagesc(Avg_img);
colormap gray;

% compute PCA space
[U,Mu] = dual_pca(A);

y = project(Avg_vec, U, Mu); % Mu == Avg_vec
% y(2) = y(2) + 2; 
% y(3) = y(3) + 2; 
x = reconstruct(y, U, Mu);

% figure;
% imagesc(reshape(x,[96,84]));
y1 = y;
% scalar = 30;

for scalar = linspace(-20, 20, 50)
% for i = 1:20
    % TODO: compute the projection, reshape it to image and store it to the variable image
    fprintf('iteration for scalar %0.1f\n', scalar)
    y1(2) = scalar * sin(scalar);
    y1(3) = scalar * cos(scalar);
    
    x = reconstruct(y1, U, Mu);
    
    image = reshape(x, [96,84]);
    figure(1); imshow(uint8(image),'InitialMagnification','fit');
    pause(0.1);
end;

figure;
subplot(1,2,1);
% imshow(uint8(Avg_img)); title('original');
imshow(uint8(Avg_img),'InitialMagnification','fit'); title('original');

subplot(1,2,2);
% imshow(uint8(image)); title('new');
imshow(uint8(image),'InitialMagnification','fit'); title('new');

% 
% I_vector = reshape(I,[84*96,1]);
% 
% subplot(1,10,1);
% imshow(I); title('1'); 
% 
% retain = 32;
% for i = 1:6
%     y = project(I_vector, U, Mu);
%     U_new = U;
%     U_new(:,retain:end) = 0;
%     x = reconstruct(y, U_new, Mu);
%     x = reshape(x, [96,84]);
%     subplot(1,7,i+1);
%     colormap gray;
%     imagesc(uint8(x)); axis tight;
%     title(['vectors retained: ' num2str(retain) ]);
%     retain = retain / 2;
% end
% 
% subplot(1,6,1);
% imagesc(I); axis tight; title('original image');
colormap gray;

toc;