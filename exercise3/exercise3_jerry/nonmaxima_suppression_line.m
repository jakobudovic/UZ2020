function Imax = nonmaxima_suppression_line(Imag, Idir)
[h, w] = size(Imag);
Imax = zeros(h,w);
offx = [-1 -1 0 1 1 1 0 -1 -1];
offy = [ 0 -1 -1 -1 0 1 1 1 0];
for y = 1:h
    for x = 1:w
        dir = Idir(y, x); % check pixel orientation
        idx = round(((dir + pi) / pi) * 4) + 1; % map orientation to the lookup table
        y1 = y + offy(idx) ; x1 = x + offx(idx);
        y2 = y - offy(idx) ; x2 = x - offx(idx);
        x1 = max([1, x1]); x1 = min([w, x1]); % constrain coordinates
        y1 = max([1, y1]); y1 = min([h, y1]);
        x2 = max([1, x2]); x2 = min([w, x2]);
        y2 = max([1, y2]); y2 = min([h, y2]);
        if((Imag(y, x) >= Imag(y1, x1))&&(Imag(y, x) >= Imag(y2, x2))) % check if local maxima
            Imax(y, x) = Imag(y, x) ;
        end
    end
end
