function Ig = simple_convolution(I, g)
N = (length(g) - 1) / 2
Ig = zeros(1, length(I));
for i = N+1:length(I)-N
    i_left = max([1, i - N]);
    i_right = min([length(I), i + N]);
    Ig(i) = sum(g .* I(i_left:i_right));
end

