function threshold = otsu(I)
nbins = 256;
counts = myhist(I, nbins); % Obtain the histogram
p = counts / sum(counts); % Normalize the histogram
sigma = zeros(nbins, 1);
for t = 1 : nbins
qlow = sum(p(1:t));
qhigh = sum(p(t + 1 : end));
miu_L = sum(p(1:t) .* (1:t)) / qlow;
miu_H = sum(p(t + 1 : end) .* (t + 1 : nbins)) ./ qhigh;
sigma(t) = qlow * qhigh * (miu_L - miu_H) ^ 2;
end
[~, threshold] = max(sigma(:));
end