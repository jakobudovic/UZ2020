function [Ix, Iy] = image_derivatives(I, sigma)

[G, x1] = gauss(sigma);
[D, x2] = gaussdx(sigma);

Ix = conv2(conv2(I, G'), D);
Iy = conv2(conv2(I, D'), G);
