A = rgb2gray(imread('bird.jpg'));
M = A > 51; % all elements with value > 150 are changed to 1, others are changed to 0

[H, bins]= myhist(A, 255);

figure;
subplot(2,2,1);
imagesc(A);
% figure;

subplot(2,2,2);
imagesc(M);

subplot(2,2,3); 
imagesc(H);

subplot(2,2,4); 
bar(H); 
colormap gray;
