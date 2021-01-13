function [px, py, M1] = harris_points1( I, sigma, thresh )
[Ix, Iy] = image_derivatives(I,sigma);
A = gaussfilter(Ix.^2,sigma*1.6)*sigma^2;%conv2(Ix.^2,gauss(1.6*sigma),'same');
C = gaussfilter(Ix.*Iy,sigma*1.6)*sigma^2;%conv2(Ix.*Iy, gauss(1.6*sigma),'same');
B = gaussfilter(Iy.^2,sigma*1.6)*sigma^2;%conv2(Iy.^2,gauss(1.6*sigma),'same');

M = (A.*B-C.^2 - 0.06.*((A+B).^2));
M1 = M.*(M>thresh);
fun = @(x) x(5)*all(x(5) > x([1,2,3,4,6,7,8,9]));
M1 = nlfilter(M1, [3 3], fun);
[py,px] = find(M1);