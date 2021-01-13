function [Ie] = findedges(I, sigma, theta)

[Imag, Idir] = gradient_magnitude(I, sigma);

Imax = nonmaxima_suppression_line_optimized(Imag, Idir);

Ie = (Imax >= theta);