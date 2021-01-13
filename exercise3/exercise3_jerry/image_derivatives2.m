function [Ixx, Iyy, Ixy] = image_derivatives2(I, sigma)
g1 = gauss(sigma);
g2 = gauss(sigma)';
[Ix, Iy] = image_derivatives(I,sigma);
%{
second derivate for x and y
Ixx(x, y) = d/dx g(x) ? [g(y) ? Ix(x, y)]
Iyy(x, y) = d/dy g(y) ? [g(x) ? Iy(x, y)].
---------
And their mix:
Ixy(x,y) = d/dy g(y) ? [g(x) ? Ix(x, y)].
it can also be done the other way around (y first then x)
%}
Ixx = conv2(conv2(Ix, g2,'same'),gaussdx(sigma),'same');
Iyy = conv2(conv2(Iy, g1,'same'),gaussdx(sigma)','same');
Ixy = conv2(conv2(Iy,g2,'same'),gaussdx(sigma),'same');