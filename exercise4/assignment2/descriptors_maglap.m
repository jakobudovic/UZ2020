function D = descriptors_maglap(I, px, py, m, sigma, bins)
    rad = round((m - 1) / 2);
    [h, w] = size(I);
    D = zeros(length(px), bins ^ 2);
    [Imag, Ilap] = features_maglap(I, sigma, bins);
    for i = 1 : length(px)
        minx = max([px(i) - rad, 1]);
        maxx = min([px(i) + rad, w]);
        miny = max([py(i) - rad, 1]);
        maxy = min([py(i) + rad, h]);
        Rmag = Imag(miny:maxy, minx:maxx);
        Rlap = Ilap(miny:maxy, minx:maxx);
        d = accumarray(cat(2, Rmag(:), Rlap(:)), 1, [bins, bins]);
        D(i,:) = d(:) / sum(d(:));
    end
end