function [Ix, Iy] = image_derivatives( I, sigma )

G = gauss(sigma);
D = gaussdx(sigma);

Ix = conv2(conv2(I,D),G');
Iy = conv2(conv2(I,D'),G);


