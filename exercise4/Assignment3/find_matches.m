function M = find_matches(I1, I2)

% divide image by 256
I1 = I1 ./ 256;
I2 = I2 ./ 256;

sigma = 6;
thresh = 5000;
m = 41;
bins = 16;

[x1, y1, A1] = hessian_points(I1, sigma, thresh);
[x2, y2, A2] = hessian_points(I2, sigma, thresh);

sigma = 1;
% descriptors
D1 = descriptors_maglap(I1, x1, y1, m, sigma, bins);
D2 = descriptors_maglap(I2, x2, y2, m, sigma, bins);

[indices, distances] = find_correspondences(D1, D2);
[indices2,~] = find_correspondences(D2,D1); % flip the descriptors

M = [];

for i = 1:length(indices)
    if(i == indices2(indices(i)))
        row = [x1(i),y1(i),x2(indices(i)),y2(indices(i)),distances(i)];
        M = [M ; row];
    end
end
