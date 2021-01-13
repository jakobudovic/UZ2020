close all
I = imread('museum.jpg');
I = rgb2gray(I);
sigma = 1;
theta = 1;
[Ie] = findedges(I,sigma,theta);
figure()
colormap gray
subplot(2,3,1);imagesc(findedges(I,sigma,theta)*255);title("theta = 1");
subplot(2,3,2);imagesc(findedges(I,sigma,theta*5)*255);title("theta = 5");
subplot(2,3,3);imagesc(findedges(I,sigma,theta*10)*255);title("theta = 10");
subplot(2,3,4);imagesc(findedges(I,sigma,theta*25)*255);title("theta = 25");
subplot(2,3,5);imagesc(findedges(I,sigma,theta*35)*255);title("theta = 35");
subplot(2,3,6);imagesc(findedges(I,sigma,theta*50)*255);title("theta = 50");
