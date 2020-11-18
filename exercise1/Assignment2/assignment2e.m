% images go from img1.jpg- the lighest - to the img5.jpg - the darkest.

A1 = rgb2gray(imread('img1.jpg'));
A2 = rgb2gray(imread('img2.jpg'));
A3 = rgb2gray(imread('img3.jpg'));
A4 = rgb2gray(imread('img4.jpg'));
A5 = rgb2gray(imread('img5.jpg'));

num_bins = 50
[H1, bins1]= myhist(A1, num_bins);
[H2, bins2]= myhist(A2, num_bins);
[H3, bins3]= myhist(A3, num_bins);
[H4, bins4]= myhist(A4, num_bins);
[H5, bins5]= myhist(A5, num_bins);

figure();
% ----- img1.jpg

subplot(5,2,1);
imagesc(A1);

subplot(5,2,2);
bar(H1); 
colormap gray;

% -----  img2.jpg

subplot(5,2,3);
imagesc(A2);

subplot(5,2,4);
bar(H2); 
colormap gray;

% ----- img3.jpg

subplot(5,2,5);
imagesc(A3);

subplot(5,2,6);
bar(H3); 
colormap gray;

% ----- img4.jpg

subplot(5,2,7);
imagesc(A4);

subplot(5,2,8);
bar(H4); 
colormap gray;

% ----- img5.jpg

subplot(5,2,9);
imagesc(A5);

subplot(5,2,10);
bar(H5); 
colormap gray;

% ----- Interpretation -----

%{
    The better lit picture has nicer/smoother curved histogram. The reason
    being is, well, better lightning. That means colors were picked up with
    better accuracy, where as darker pictures had their "true colors"
    distorted. 
    We can also see, that curves tend to move slowly towards the left -
    more darker shadows of grey, less highlights.
    I used a plant as an object, for fun :)
%}




