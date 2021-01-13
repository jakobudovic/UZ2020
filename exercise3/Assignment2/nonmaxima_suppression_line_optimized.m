function Imax = nonmaxima_suppression_line_optimized(Imag, Idir)
[h, w] = size(Imag);
Imax = zeros(h,w);
offx = [-1 -1 0 1 1 1 0 -1 -1];
offy = [ 0 -1 -1 -1 0 1 1 1 0];

% for y = 2:h
    
    DIR = Idir(:, 2:end-1); % check pixel orientation for a row
    
    IDX = round(((DIR + pi) / pi) * 4) + 1;
    Imag1 = circshift(I, [0, -1]); % shift everything 1 col left
    Imag2 = circshift(I, [-1, -1]); % shift everything 1 row down, 1 col down
    Imag3 = circshift(I, [-1, 0]); % shift everything 1 col down
    Imag4 = circshift(I, [-1, 1]); % shift everything 1 row down, 1 col right
    Imag5 = circshift(I, [0, 1]); % shift everything 1 col right
    Imag6 = circshift(I, [1, 1]); % shift everything 1 row up, 1 col right
    Imag7 = circshift(I, [1, 0]); % shift everything 1 row up --
    Imag8 = circshift(I, [1, -1]); % shift everything 1 row up, 1 col left
    % compare
    Imax = 
    
% end