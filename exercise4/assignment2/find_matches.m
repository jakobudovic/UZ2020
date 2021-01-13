function M = find_matches(I1, I2)

sigma = 2;
thresh = 50000;
m = 41;
bins = 32;
sigma1 = 9;

% sigma = 2;
% thresh = 10000;
% m = 88;
% bins = 32;

[x1, y1, A1] = hessian_points(I1, sigma, thresh);
[x2, y2, A2] = hessian_points(I2, sigma, thresh);


% descriptors 
D1 = descriptors_maglap(I1, x1, y1, m, sigma1, bins);
D2 = descriptors_maglap(I2, x2, y2, m, sigma1, bins);

[indices, distances] = find_correspondences(D1, D2);
[indices2,~] = find_correspondences(D2,D1); % flip the descriptors

M = [];

for i = 1:length(indices)
    if(i == indices2(indices(i)))
        row = [x1(i),y1(i),x2(indices(i)),y2(indices(i)),distances(i)];
        M = [M ; row];
    end
end


