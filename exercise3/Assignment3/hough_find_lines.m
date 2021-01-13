function [out_ro, out_theta, I1, I2] = hough_find_lines(Ie, bins_rho, bins_theta, threshold)

A = zeros(bins_rho, bins_theta);

max_rho = hypot(size(Ie,1),size(Ie,2)); % diagonal of the image
val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % Values of theta are known
val_rho = linspace(-max_rho, max_rho, bins_rho);

[X,Y] = find(Ie); % non-zero elements, coordinates

rho = X(:) .* cos(val_theta) + Y(:) .* sin(val_theta); % compute rho for all thetas
bin_rho = round(((rho + max_rho) / (2 * max_rho)) * length(val_rho)); % Compute bins for rho

for j=1:length(X) % go through all points
    for i = 1:bins_theta % Go over all the candidates for voting
        if bin_rho(j,i) > 0 && bin_rho(j,i) <= bins_rho % Mandatory out-of-bounds check
            A(bin_rho(j,i), i) = A(bin_rho(j,i), i) + 1; % Increment the accumulator cells
        end
    end
end

B = A;
% B = B(B(:) >= threshold);
B = (B >= threshold) .* B;
B = nonmaxima_suppression_box(B);
[r,c] = find(B); 

I1 = A;
I2 = B;

% arrays for output
out_ro = val_rho(r);
out_theta = val_theta(c);

