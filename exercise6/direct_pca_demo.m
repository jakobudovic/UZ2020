function direct_pca_demo()
 
figure(1); clf;
P = load('points.txt') ; 
subplot(1,2,1);
plot(P(1,:),P(2,:),'+'); hold on;
for i = 1 : size(P,2)
   text( P(1,i)-0.5, P(2,i), num2str(i)); 
end
xlabel('x_1'); ylabel('x_2');
xlim([-10 10]);
ylim([-10 10]);


