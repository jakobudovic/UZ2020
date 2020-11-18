function Ig = laplacian(I, sigma)

x = -round(3.0*sigma):round(3.0*sigma);
g = ((1 / (sqrt(2*pi)*sigma)) * exp(-x.^2 / (2 * sigma^2)));
g = g / sum(g); % normalisation

% create unit vector with the same dimensions as the gaussian vector
unit = zeros(size(g));
unit(ceil(end/2)) =  1; % impulse

% subtract gaussian filter from unit impulse
l = unit - g; 

Ib = conv2(I, l, 'same');
Ig = conv2(Ib, l', 'same');