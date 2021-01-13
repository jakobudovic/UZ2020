function H = estimate_homography(px1, py1, px2, py2)

% create matrix A
A = [];

for i = 1:length(px1)
    first_row = [px1(i), py1(i), 1, 0, 0, 0, -px2(i)*px1(i), -px2(i)*py1(i), -px2(i)];
    second_row = [0, 0, 0, px1(i), py1(i), 1, -py2(i)*px1(i), -py2(i)*py1(i), -py2(i)];
    combined = [first_row ; second_row];
    A = [A ; combined];
end

% matrix decomposition
[U, S, V] = svd(A);

[V_height,V_width] = size(V);

% get the last vector (col) in the matrix V
% it has the smallest value to it
last_vector = V(:,V_width);

% compute h by transposing last vector and dividing it with last element
h = last_vector' ./ last_vector(V_height);

H = reshape(h, [3,3])';
