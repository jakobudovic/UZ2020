function [ H, bins ] = myhist(I , nbins) % H, bins are outputs and I,nbins are inputs
I = reshape(I, 1, numel(I) ); % reshape image in 1D vector 1xI_len
H = zeros(1, nbins) ; % initialize the histogram
max_val_in = 255 ; % highest input value
min_val_in = 0 ; % lowest input value
max_val_out = nbins; % highest cell index
min_val_out = 1 ; % lowest cell index
% Compute bin numbers for all pixels
f = (max_val_out - min_val_out) / (max_val_in - min_val_in); % Compute the scaling factor
idx = floor(double(I) * f) + min_val_out; % Calculate indices for all pixels, rounding them down
idx(idx > nbins) = nbins; % Truncate the outliers
for i = 1 : length(I) % Now iterate the image and increase appropriate histogram cell for each ←-
% pixel
H(idx(i)) = H(idx(i)) + 1;
end
% Normalize the histogram (sum of cell values equals 1)
H = H / sum(H) ;
% Compute reference values for all cells in the histogram
bins = ( (1 : nbins) - min_val_out) ./ f;
end