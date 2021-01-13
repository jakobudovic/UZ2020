function [Ix, Iy] = image_derivatives(I, sigma)

[G, x1] = gauss(sigma);
[D, x2] = gaussdx(sigma);


Ix = conv2(conv2(I, G', 'same'), D, 'same');
Iy = conv2(conv2(I, D', 'same'), G, 'same');

%{
% full, same, valid
'full' — Return the full 2-D convolution.
'same' — Return the central part of the convolution, which is the same size as A.
'valid' — Return only parts of the convolution that are computed without zero-padded edges.
%}