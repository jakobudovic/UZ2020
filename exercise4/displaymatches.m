function displaymatches(I1, px1, py1, I2, px2, py2)
% Displays images I1, and I2 side by side and visualizes correspondences
% I1 - first image
% px1 - vector of X coordinates of points in first image
% py1 - vector of Y coordinates of points in first image
% I2 - second image
% px2 - vector of X coordinates of points in second image
% py2 - vector of Y coordinates of points in second image

px1 = px1(:); py1 = py1(:);
px2 = px2(:); py2 = py2(:);

[h1, w1, cn1] = size(I1);
[h2, w2, cn2] = size(I2);

h = max([h1, h2]);
w = w1 + w2 + 1;
cn = max([cn1,cn2]);
I = zeros(h, w, cn);
I(1:h1, 1:w1, 1:cn1) = I1;
I(1:h2, w1+2:w, 1:cn2) = I2;

fh = gcf;
imshow(uint8(I)); colormap gray;
figure(fh); hold on;
plot([w1+1,w1+1], [0, h], 'r', 'LineWidth', 4) ;
px2 = px2 + w1+1 ; 
plot([px1', px2'], [py1', py2'], 'oy') ;
for i = 1 : length(px1)
   plot([px1(i),px2(i)], [py1(i),py2(i)], 'g-', 'LineWidth', 1) ;       
end
hold off;
