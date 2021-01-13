function [NP, T] = normalize_points(P)
P = P(1:2,:);
mu = mean(P,2);
scale = sqrt(2) / mean(sqrt(sum((P - repmat(mu,1,size(P,2))) .^ 2, 1)));
T = [scale, 0, -mu(1) * scale; 0, scale, -mu(2) * scale; 0, 0, 1] ;
NP = zeros(3,size(P, 2));
for i = 1 : size(P, 2)
NP(:,i) = T * [P(:,i);1];
end