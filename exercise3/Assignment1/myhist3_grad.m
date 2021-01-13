function H = myhist3_grad(Imag, Idir, bins)
% when computing cell indices add a small factor to avoid overflow
% problems

idx = floor(double(Imag) * bins / (255 + 1e-5)) + 1;
H = zeros(bins,bins);
% increment the appropriate cell of the H(R,G,B) for each pixel in the image
for i = 1:size(Imag, 1)
    for j = 1:size(Imag, 2)
    M = idx(i, j, 1);
    D = idx(i, j, 2);
    H(M, D) = H(M, D) + 1;
    end
end
% normalize the histogram (sum of cell values should equal to 1)
H = H / sum(sum(sum(H)));
