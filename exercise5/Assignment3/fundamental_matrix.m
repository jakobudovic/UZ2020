function [F, e1, e2] = fundamental_matrix(x1, x2)

% Input: x1, x2 : 3xN N homogeneous points in 2D
% Output:
% F : 3x3 fundamental matrix: x2' * F * x1 = 0
% e1 : epipole in the first image: F * e1 = 0
% e2 : epipole in the second image: F' * e2 = 0


[NP1, T1] = normalize_points(x1);
[NP2, T2] = normalize_points(x2);
%{
A = [];
for i = size(NP1, 2) % go over all points
    u = NP2(1,i);
    v = NP2(2,i);
    u1 = NP1(1,i);
    v1 = NP1(2,i);
    A(i,:) = [u*u1, u*v1, u, v*u1, v*v1, v, u1, v1, 1];
end;
%}

N = length(NP1);
A = zeros(N,9);
NP1 = NP1';
NP2 = NP2';

u1 = NP1(:,1);
u2 = NP2(:,1);
v1 = NP1(:,2);
v2 = NP2(:,2);

A(:,1) = u1.*u2;
A(:,2) = u1.*v2;
A(:,3) = u1;
A(:,4) = v1.*u2;
A(:,5) = v1.*v2;
A(:,6) = v1;
A(:,7) = u2;
A(:,8) = v2;
A(:,9) = 1;

% get SVD form matrix A
[~, ~, V] = svd(A);

% Get the vector that corresponds to the smallest eigenvalue (last one,
% eigenvalues are ordered from lar  gest to smallest), transform it to 3x3
v = V(:,9);
Ft = reshape(v,[3,3]);

% reconstruct the F
[U,D,V] = svd(Ft);
% last element set to 0 -> reduce the rank to  2
D(3,3) = 0; % last element is already 0 ??
Ft = U * D * V';
 % transform the fundamental matrix back to original space
 % wioth both transformation matrices
F = T2' * Ft * T1;

[U,~,V] = svd(Ft);

% compute epipoles
e1 = V(:,3)/V(3,3);
e2 = U(:,3)/U(3,3);

% x2' .* F .* x1

% sanity check, should get 0, i dont get it 
% Ft * e1
% Ft' * e2