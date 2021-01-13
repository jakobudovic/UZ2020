function [px, py, response] = harris_points( I, sigma, thresh )

sigma_approx = 1.6*sigma;
alpha = 0.06;

% Find second derivatives
[Ix,Iy] = image_derivatives(I,sigma);
Gauss = gauss(sigma_approx);

% Create auto-correlation matrix
A = gaussfilter(Ix.^2,sigma_approx)*sigma^2; % conv2(Ix.^2,Gauss,'same');
B = gaussfilter(Ix.*Iy,sigma_approx)*sigma^2; % conv2(Iy.^2,Gauss,'same');
C = gaussfilter(Iy.^2,sigma_approx)*sigma^2; % conv2(Ix.*Iy,Gauss,'same');

det = A .* B - C .^2;
trace = A + B;

response = det - alpha .* trace .^2;

% Perform non-maxima suppresion and thresholding
peaks = nonmaxima_suppression_box(response, thresh);
[py,px] = find(peaks > 0);







