function [indices, distances] = find_correspondences(D1, D2)

% n rows
[r1,~] = size(D1);
[r2,~] = size(D2);

indices = zeros(r1, 1);
distances = zeros(r2, 1);   3

% Compare point in the first image to all the points in the second
for i = 1:r1
    % Precompute all values to later find the minimum
    distances1 = zeros(1,r2);
    for j = 1:r2
        distances1(1,j) = compare_histograms(D1(i,:),D2(j,:),'hellinger');
    end
    [val,idx] = min(distances1);
    indices(i,1) = idx;
    distances(i,1) = val;
end


