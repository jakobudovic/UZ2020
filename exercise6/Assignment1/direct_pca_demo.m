function direct_pca_demo()
 
figure(1); clf;
P = load('points.txt');
N = size(P, 2);
Mu = mean(P,2);

q = [3;6];

% center data
P_centered = P - Mu;
% covariance matrix
C = (1/(N-1)) * P_centered * P_centered';

% SVD decomposition
[U, S, ~] = svd(C);
subplot(1,2,1);
plot(P(1,:),P(2,:),'+'); 
plot(q, 'b+'); % our "random" point
hold on;

% calculate the closest point to q with eucl dist
euc_dist = [];
for i = 1 : size(P,2)
   text( P(1,i)-0.5, P(2,i), num2str(i)); 
   euc_dist = [euc_dist, sqrt(sum((q - P(:,i)).^2))];
end

[min_dist_before,idx] = min(euc_dist); % closest point at index 3

% extend eigen vectors with their eigenvalues
U(:,1) = U(:,1) * S(1,1);
U(:,2) = U(:,2) * S(2,2);

plot([0,U(1,1)] + Mu(1),[0,U(2,1)]+ Mu(2),'r')
plot([0,U(1,2)] + Mu(1),[0,U(2,2)]+ Mu(2),'g')

for i = 1 : size(P,2)
   text( P(1,i)-0.5, P(2,i), num2str(i)); 
end
xlabel('x_1'); ylabel('x_2');
xlim([-10 10]);
ylim([-10 10]);

plot([0,U(1,1)] + Mu(1),[0,U(2,1)]+ Mu(2),'r')
plot([0,U(1,2)] + Mu(1),[0,U(2,2)]+ Mu(2),'g')
draw_gauss2d(Mu, C, 'r', 1)

% get eigenvectors back to their original length
U(:,1) = U(:,1) / S(1,1);
U(:,2) = U(:,2) / S(2,2);

% get cov matrix, remove second eigenvector
P_PCA = U' * P_centered;
q_centered = q - Mu;
q_PCA = U' * q_centered;
U(:,2) = 0;

% transform points to the first eigenvector
P_after = U * P_PCA + Mu;
q_after = U * q_PCA + Mu;
plot(P_after(1,:),P_after(2,:),'*');
plot(q_after(1,:),q_after(2,:),'*');

% plot the lines between originals and  projections on the 1D space
draw_reconstructions(P, P_after);
draw_reconstructions(q, q_after);

euc_dist_after = [];
for i = 1 : size(P,2)
   euc_dist_after = [euc_dist_after, sqrt(sum((q_after - P_after(:,i)).^2))];
end
[min_dist_after,idx_after] = min(euc_dist_after);
% we get the same result, idx 3


subplot(1,2,2);
    
S_sum = sum(S);
S_cumsum = cumsum(S_sum);
cumulative_percentage = S_cumsum/sum(S_sum);
bar(cumulative_percentage) % cca 84% of reconstruction information


