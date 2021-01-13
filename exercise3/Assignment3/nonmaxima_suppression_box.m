function B = nonmaxima_suppression_box(A)
% max filter

B=A;
A = ordfilt2(A, 9, ones(3));
B(A==0) = 0;
max(B(:))

% B = ordfilt2(A, 9, ones(3,3)); 

% set values to 0 if they're not max
sort(B(:));
% B(B(:)~=max(B(:))) = 0;

% B((max(B(:))-B) >= 10) = 0;
