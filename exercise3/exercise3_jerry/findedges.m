function [Ie] = findedges(I, sigma, theta)
[Imag , Idir] = gradient_magnitude(I,sigma);
%update za b)
%----

Imag = nonmaxima_suppression_line(Imag,Idir);

%----
Ie = Imag>=theta;
Ie(1,:) = 0;
Ie(size(Ie,1),:) = 0;
Ie(:,1) = 0;
Ie(:,size(Ie,2)) = 0;
%razlog za to je slika oneline.png, obodi slik naj ne bodo "1"