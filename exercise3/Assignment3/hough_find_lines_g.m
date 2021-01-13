function [out_ro, out_theta, I1, I2] = hough_find_lines_g(Ie, Idir, bins_rho, bins_theta, threshold)
%theta - angle
%rho - distance from the origin
Idir
% Transform/shift the Idir angles to [-pi/2,pi/2]
Idir = Idir + pi/2;
tmp = mod(Idir+pi/2,pi);
Idir = tmp+pi*(Idir>0 & tmp==0) - pi/2;
A = zeros(bins_rho, bins_theta);

max_rho = hypot(size(Ie,1),size(Ie,2)); % diagonal of the image
val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % Values of theta are known
val_rho = linspace(-max_rho, max_rho, bins_rho);

[X,Y] = find(Ie); % non-zero elements, coordinates

for j=1:length(X) % go through all points
    
    x = X(j);
    y = Y(j);
    theta = Idir(x,y); 
    rho = x * cos(theta) + y * sin(theta); % calculate again
    [~,theta_bin_idx] = min(abs(val_theta - theta));
    [~,rho_bin_idx] = min(abs(val_rho - rho)); 
    
    
    % new voting
    A(rho_bin_idx, theta_bin_idx) = A(rho_bin_idx, theta_bin_idx) + 1;
    
end

B = A;
% B = B(B(:) >= threshold);

figure(3);
imagesc(B);
B = (B >= threshold) .* B;


B = nonmaxima_suppression_box(B);

[r,c] = find(B); 

I1 = A;
I2 = B;

% arrays for output
out_ro = val_rho(r);
out_theta = val_theta(c);
