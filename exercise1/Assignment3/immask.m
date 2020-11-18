function [X, Y, Z, C] = immask(C3, B)
% returns image M, accepts images 3C and B
X = C3(:,:,1);
Y = C3(:,:,2);
Z = C3(:,:,3);

B1 = double(B);

X(B1 == 0) = 0;
Y(B1 == 0) = 0;
Z(B1 == 0) = 0;
%{
X1 = double(X) .* B1;
Y1 = double(Y) .* B1;
Z1 = double(Z) .* B1;

X1 = int8(floor(X1));
Y1 = int8(floor(Y1));
Z1 = int8(floor(Z1));
%}

% C = cat(dim,A,B) concatenates B to the end of A along dimension dim when A and B have compatible sizes (the lengths of the dimensions match except for the operating dimension dim).

C = cat(3, X, Y, Z);
end