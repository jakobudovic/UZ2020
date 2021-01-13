function [U,Mu] = dual_pca(A)
A = double(A);

% Compute mean value
Mu = mean(A,2);

% Center data
A_centered = A - Mu;

% Compute covariance matrix
m = size(A,1);
A_cov = (1 / (m - 1)) * (A_centered' * A_centered);

% Compute SVD
[U_d,S_d,~] = svd(A_cov);

% Make a numerically stable calculation (add small value to the diagonal)
s = diag(S_d) + 1e-15; % Extract the diagonal as a vector and add a small constant
Si = diag(1 ./ sqrt(s * (m - 1))); % Compute the inverse and construct a diagonal matrix
U = A_centered * U_d * Si;


