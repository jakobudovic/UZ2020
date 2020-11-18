I = double(rgb2gray(imread('umbrellas.jpg')));
P = I(:); % A handy way to turn 2D matrix into a vector of numbers
figure(1); clf; 
bins = 10 ;
H = hist(P, bins);
subplot(1,3,1); bar(H, 'b');
bins = 20 ;
H = hist(P, bins);
subplot(1,3,2); bar(H, 'b');
bins = 40 ;
H = hist(P, bins);
subplot(1,3,3); bar(H, 'b');

% The answer is because with less bins/bars, smaller bars get merged into 
% bigger ones. Therefore there is less of them, but they have a wider range
% - including more data.