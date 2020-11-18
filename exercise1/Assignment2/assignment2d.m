A = rgb2gray(imread('eagle.jpg'));
M = (A > 160); % all elements with value > 150 are changed to 1, others are changed to 0
% M = (A < 215);

[H, bins]= myhist(A, 50);

figure;
subplot(3,2,1);
imagesc(A);
% figure;

subplot(3,2,2);
imagesc(M);

subplot(3,2,3); 
imagesc(H);

subplot(3,2,4); 
bar(H); 
colormap gray;


I = double(rgb2gray(imread('eagle.jpg')));
P = I(:); % A handy way to turn 2D matrix into a vector of numbers

bins = 50 ;
H = hist(P, bins);
subplot(3,2,6); bar(H, 'r');


% hist(x) creates a histogram bar chart of the elements in vector x. 
% The elements in x are sorted into 10 equally spaced bins along the x-axis 
% between the minimum and maximum values of x. hist displays bins as rectangles, 
% such that the height of each rectangle indicates the number of elements in the bin.

% If the input is a multi-column array, hist creates histograms for each 
% column of x and overlays them onto a single plot.

% If the input is of data type categorical, each bin is a category of x.

%{
   The values in with the myhist() are normalized and therefore we see a percentage
   of each pixel batch value.
%}