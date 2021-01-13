% old function for comparing histogram distances
function d = compare_histograms(h1,h2,dist_name)
switch dist_name
    case 'l2'
        inside = (h1 - h2).^2;
        d = sqrt(sum(inside(:)));
    case 'chi2'
        inside = ((h1 - h2).^2)./(h1 + h2 + 1e-10);
        d = 0.5 * sum(inside(:));
    case 'hellinger'
        inside = (sqrt(h1) - sqrt(h2)).^2;
        d = sqrt(0.5 * (sum(inside(:))));
    case 'intersect'
        inside = min(h1,h2);
        d = 1 - sum(inside(:));
    otherwise
        error('Unknown distance type!')
end