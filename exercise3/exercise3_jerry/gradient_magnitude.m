function [Imag, Idir] = gradient_magnitude(I, sigma)

[Ix, Iy] = image_derivatives(I,sigma);
Imag = sqrt(Ix.^2+Iy.^2);
Idir = atan2(Iy,Ix);
