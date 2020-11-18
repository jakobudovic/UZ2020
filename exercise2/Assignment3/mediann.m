function Ig = mediann(I, W)

% I signal, W width
Ig = I;

for j = W+1:size(I,1)-W
    i_top = max([1, j - W]);
    i_bottom = min([length(I), j + W]);
    
    for i = W+1:size(I,2)-W
        i_left = max([1, i - W]);
        i_right = min([length(I), i + W]);
        II = I(i_left:i_right,i_top:i_bottom); 
        % reshape to 1D array beofre finding the median
        I_1D = reshape(II, [], 1);
        Ig(i,j) = median(I_1D);
    end
end
