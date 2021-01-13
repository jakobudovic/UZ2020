function [Ixx, Iyy, Ixy] = image_derivatives2(I, sigma)

[G, x1] = gauss(sigma);
[D, x2] = gaussdx(sigma);

B = conv2(conv2(I, G), D');

[Ix, Iy] = image_derivatives(I, sigma); % get first derivative
Ixx = conv2(conv2(Ix, G'), D);

Ixy = conv2(conv2(Ix, G), D');

Iyy = conv2(conv2(Iy, G), D');

