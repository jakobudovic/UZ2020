function show_triangulation(X)
plot3(X(1,:), X(2,:), X(3,:), 'rx', 'LineWidth', 2);
hold on;
for i = 1 : size(X,2) 
   text(X(1,i), X(2,i), X(3,i), num2str(i)) ;
end;
hold off;
axis equal; 

