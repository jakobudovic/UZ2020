function B = nonmaxima_suppression_box(A,thresh)

% Create that will check all but the middle element
mask = ones(3);
mask(5) = 0;
% Find the maximal element in the neighbourhood and replace the
% selected element with it
local_maxima = ordfilt2(A,8,mask);
% Compare the image to local maxima -> if the selected element was
% local maxima it holds true
peaks = A > local_maxima;
% Filter out the local maxima
B = (A .* peaks) > thresh;