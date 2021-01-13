function [g, x] = gaussdx(sigma)
x = -round(3.0*sigma):round(3.0*sigma);
g = -((1 / (sqrt(2*pi)*sigma^3) * x) .* exp(-x .^ 2 / (2 * sigma^2)));
g = g / sum(abs(g)); % normalisation with absolute values
