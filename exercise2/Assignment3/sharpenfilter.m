function Ig = sharpenfilter(I)

g1 = [0,0,0; 0,2,0; 0,0,0];
g2 = 1/9 .* ones(3,3);

g = g1 - g2;
Ig = conv2(I, g, 'same');

%{
Ib = conv2(I, g1, 'same');
Ig = conv2(Ib, g2', 'same');
%} 