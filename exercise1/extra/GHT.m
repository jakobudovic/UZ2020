function threshold = otsu(I)
nbins = 256; % n
nu = 0;
tau = 0;
kappa = 0;
omega = 0.5;
counts = myhist(I, nbins); % Obtain the histogram
p = counts / sum(counts); % Normalize the histogram
sigma = zeros(nbins, 2);

maxT = 0;
maxY = 0; 
count = 0;

for t = 1 : nbins
qlow = sum(p(1:t)); % w0
qhigh = sum(p(t + 1 : end)); % w1
w0 = qlow;
w1 = qhigh;

pi_0 = qlow ./ size(p(1:t)); % mu_0
pi_1 = qhigh ./ size(p(1+t : end)); % mu_1  ((% = 1 - pi_0))??

miu_L = sum(p(1:t) .* (1:t)) / qlow; 
miu_H = sum(p(t + 1 : end) .* (t + 1 : nbins)) ./ qhigh; 

d0 = sum(p(1:t) .* ((1:t) .^ 2)) - qlow * pi_0 .^ 2;
d1 = sum(p(t + 1 : end) .* ((t + 1 : nbins)) .^ 2) - qhigh * pi_1 .^ 2;

v0 = ((w0 / (w0 + w1)) * nu * tau.^2 + d0) / ((w0 / (w0 + w1)) * nu + w0); 
v1 = ((w1 / (w0 + w1)) * nu * tau.^2 + d1) / ((w1 / (w0 + w1)) * nu + w1);

f0 = -d0 / v0 - w0 * log(v0) + 2 * (w0 + kappa * omega) * log(w0)
f1 = -d1 / v1 - w1 * log(v1) + 2 * (w1 + kappa * (1 - omega)) * log(w1)


fprintf("f0 size : %s\n", mat2str(size(f0)));
fprintf("f1 size : %s\n", mat2str(size(f1)));
fprintf("sigma size : %s\n", mat2str(size(sigma)));
fprintf("sigma(t) size : %s\n", mat2str(size(sigma(t))));

y = f0 + f1
if y > maxY
    maxY= y;
    count = 1;
    maxT = t;
elseif y == maxY
    maxY = maxY + y;
    count = count + 1;
    % maxY  ostane isti
end
end
threshold = maxT / count % we average it
% [~, threshold] = max(sigma(:));
end
