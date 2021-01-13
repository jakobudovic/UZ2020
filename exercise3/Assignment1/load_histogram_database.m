function [histograms, files] = load_histogram_database(directory, bins)
files = cell(30 * 4, 1); % We will use cell array to store filenames
% initialize matrix for histograms
histograms=zeros(30 * 4, bins^3);
% calculate histogram for each image
for i = 1:30 % Iterate objects
    for j = 1:4 % Iterate orientations
        image = (i-1) * 4 + j;
        files{image} = fullfile(directory, sprintf('object_%02d_%d.png', i, j));
        % TODO: load image, extract histogram
        name = fullfile(directory, sprintf('object_%02d_%d.png', i, j));
        img1 = imread(name);
        H = myhist3(img1,bins);
        histograms(image, :) = reshape(H, [], 1); % TODO: change 3D matrix to 1D vector and save it here
    end;
end;
