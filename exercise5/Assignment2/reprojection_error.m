function [d, d1, d2] = reprojection_error(x1, x2, F)
% compute epipolar line for x1
l2 = F * x1;
% compute distance of x2 to l2  
d1 = abs(sum(l2.*x2)) / sqrt(l2(1).^2+l2(2).^2 );

% compute epipolar line for x2
l1 = F'*x2;
% compute distance of x1 to l1 
d2 = abs(sum(l1.*x1)) / sqrt(l1(1).^2+l1(2).^2 );

% Result is average distance
d = (d1 + d2) / 2;
