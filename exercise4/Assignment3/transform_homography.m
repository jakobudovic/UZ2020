function IT = transform_homography(I, H)
% Transforms image according to homography transfromation H
% Author: Luka Cehovin
%
% I ... input image
% H  ... homography
% IT ... output (transformed) image

[h,w,c] = size(I) ;
[X,Y] = meshgrid(1:w, 1:h) ;

sx = size(X) ;
sy = size(Y) ;

X = reshape(X,1,sx(1)*sx(2)) ;
Y = reshape(Y,1,sy(1)*sy(2)) ;
p = [X;Y;ones(1,length(X))] ;

P2 = H\p ;
P2 = round(P2./repmat(P2(3,:),3,1));

valid = P2(1, :) >= 1 & P2(1, :) <= w & P2(2, :) >= 1 & P2(2, :) <= h;
P2 = P2(:, valid);
X = X(valid);
Y = Y(valid);

src = sub2ind([h, w], P2(2, :), P2(1, :));
dst = sub2ind([h, w], Y, X);

if c > 1
    IT = cell2mat(cellfun(@(x) transform_channel(x, src, dst), mat2cell(I, h, w, ones(c, 1)), 'UniformOutput', 0));
else
    IT = transform_channel(I, src, dst);
end

function CT = transform_channel(C, src, dst)

    CT = zeros(size(C));    
    CT(dst) = C(src);
