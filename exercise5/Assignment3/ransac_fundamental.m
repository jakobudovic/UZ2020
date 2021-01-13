function [F, e1, e2, x1out, x2out] = ransac_fundamental(x1, x2, eps, k)
% Input:
% x1, x2 : 3xN matrix of N homogeneous points in 2D space
% eps : threshold for inliers
% k : number of iterations
% Output:
% F : 3x3 fundamental matrix: x2' * F * x1 = 0
% e1 : epipole in image 1: F * e1 = 0
% e2 : epipole in image 2: F' * e2 = 0
% x1, x2 : 3xNi matrix of Ni homogeneous inlier points


inliers_max = 0; % we search the max value of inlier points
for i=1:k
    % select random point  matches
    indices = randperm(size(x1, 2), 8); % random k indeces between 1 and number of points
    [F_temp, e1_temp, e2_temp] = fundamental_matrix(x1(:,indices)',x2(:,indices)');
    [x1in,x2in] = get_inliers(F_temp,x1',x2',eps);
    if(size(x1in,1) > inliers_max)
        inliers_max = size(x1in,1);
        x1out = x1in;
        x2out = x2in;
        F = F_temp;
        e1 = e1_temp;
        e2 = e2_temp;
    end
end;
% x1out
% x2out
