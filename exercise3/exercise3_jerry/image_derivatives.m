function [Ix, Iy] = image_derivatives(I, sigma)
g1 = gauss(sigma);
g2 = gauss(sigma)';
%d/dx g(x) ? [g(y) ? I(x, y)]
Ix = conv2(conv2(I, g2,'same'),gaussdx(sigma),'same');

%d/dy g(y) ? [g(x) ? I(x, y)]
Iy = conv2(conv2(I, g1,'same'),gaussdx(sigma)','same');
