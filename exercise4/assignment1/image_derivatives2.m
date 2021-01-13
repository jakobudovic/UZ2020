function [Ixx, Iyy, Ixy] = image_derivatives2( I, sigma )

G = gauss(sigma);
D = gaussdx(sigma);

[Ix,Iy] = image_derivatives(I,sigma);

Ixx = conv2(conv2(Ix,D),G');
Iyy = conv2(conv2(Iy,D'),G);
Ixy = conv2(conv2(Ix,D'),G);