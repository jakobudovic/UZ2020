A = rgb2gray(imread('bird.jpg'));

tresh = otsu(A);
[H, bins]= myhist(A, 255);

A1 = A > tresh;

figure;
subplot(2,2,1);
imagesc(A);

subplot(2,2,2);
imagesc(A1);

colormap gray;

subplot(2,2,3); 
bar(H); 
hold on;
line([tresh tresh], [0 0.1], 'color', 'r');
colormap gray;

subplot(2,2,4);
imagesc(A>51); % manually set treshold, from assignment2 a

tresh