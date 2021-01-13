function [Imag, Ilap] = features_maglap(I, sigma, bins)

    Imag = gradient_magnitude(I, sigma);
    [imgDxx, imgDxy, imgDyy] = image_derivatives2(I, sigma);
    Ilap = imgDxx + imgDyy;

    Imag(Imag > 100) = 100;
    Imag = floor(Imag * (bins / 101)) + 1;

    Ilap = Ilap + 60;
    Ilap(Ilap < 0) = 0;
    Ilap(Ilap > 119) = 119;
    Ilap = floor(Ilap * (bins / 120)) + 1;
