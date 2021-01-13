function [Ie, Idir] = findedges_g(I, sigma, theta)

[Imag, Idir] = gradient_magnitude(I, sigma);

Imax = nonmaxima_suppression_line(Imag, Idir);

Ie = (Imax >= theta);


% remove values from the edges
Ie(1,:) = 0;
Ie(size(Ie,1),:) = 0;
Ie(:,1) = 0;
Ie(:,size(Ie,2)) = 0;