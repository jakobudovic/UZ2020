%function GKernel = gauss(sigma)

%GKernel = 1/(sqrt(2*pi)*sigma)*exp(-(x^2)/(2*sigma^2))
function [g, x] = gaussdx(sigma)
x = -round(3.0*sigma):round(3.0*sigma);
g = - (x/(sqrt(2*pi)*sigma^3)).*exp(-(x.^2)/(2*sigma.^2)); %calculate Gaussian kernel for values of x (in one line)
g = g / sum(abs(g)) ; % normalisation