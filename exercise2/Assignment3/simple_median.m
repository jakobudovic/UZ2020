function Ig = simple_median(I, W)

% I signal, W width
Ig = zeros(1, length(I));
for i = W+1:length(I)-W
    i_left = max([1, i - W]);
    i_right = min([length(I), i + W]);
    
    Ig(i) = median(I(i_left:i_right));
end