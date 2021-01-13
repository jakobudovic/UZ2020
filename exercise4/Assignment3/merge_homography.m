function IT = merge_homography(I1, I2, H)
% Merges two images according to homography transfromation H
% Author: Luka Cehovin
%
% I1 ... input image
% I2 ... transformed input image
% H  ... homography from I2 to I1
% IT ... output (transformed & merged) image

[h1,w1,c1] = size(I1) ;
[h2,w2,c2] = size(I2) ;

p = H * [1 w2 w2 1; 1 1 h2 h2; ones(1,4)] ;
p = round(p./repmat(p(3,:),3,1));

wt = max(max(p(1, :)), w1);
ht = max(max(p(2, :)), h1);
[X,Y] = meshgrid(1:wt, 1:ht);
X = X(:)';
Y = Y(:)';

P2 = H \ [X; Y; ones(1,length(X))] ;
P2 = round(P2./repmat(P2(3,:),3,1));

IT = zeros(ht, wt, c1);

IT(1:h1, 1:w1, :) = I1;

valid = P2(1, :) >= 1 & P2(1, :) <= w2 & P2(2, :) >= 1 & P2(2, :) <= h2;
valid = valid & X(:)' <= wt & Y(:)' <= ht;
P2 = P2(:, valid);
X = X(valid);
Y = Y(valid);

src = sub2ind([h2, w2], P2(2, :), P2(1, :));
dst = sub2ind([ht, wt], Y, X);

if c1 > 1
    IT = cell2mat(cellfun(@(D, S) transform_channel(S, D, src, dst), mat2cell(IT, ht, wt, ones(c1, 1)), mat2cell(I2, h2, w2, ones(c2, 1)), 'UniformOutput', 0));
else
    IT = transform_channel(I2, IT, src, dst);
end

IT = uint8(IT);

function D = transform_channel(S, D, src, dst)
    D(dst) = S(src);
