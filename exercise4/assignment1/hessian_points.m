function [px, py, I_hess] = hessian_points( I, sigma, thresh)

[Ixx,Iyy,Ixy] = image_derivatives2(I, sigma);

I_hess = (sigma^4)*(Ixx .* Iyy - (Ixy).^2);

I_hess_peaks = nonmaxima_suppression_box(I_hess,thresh);

[px,py] = find(I_hess_peaks > 0);
