function dual_pca_demo()
 
% figure(1); clf;
P = load('points.txt')

% Compute mean
Mu = mean(P,2);

% Center data
P_centered = P - Mu;
m = size(P,1);

% Compute dual covariance matrix
P_cov = (1 / (m - 1)) * (P_centered' * P_centered);

% Compute SVD
[U_d,S_d,~] = svd(P_cov);
U = P_centered * U_d * (((m-1)*S_d) ^(-1/2));

P_PCA = U' * (P_centered);

% 7th step
P_after = U*P_PCA + Mu