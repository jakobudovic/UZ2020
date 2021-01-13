%{
a)
---------
first derivative for x
Ix(x, y) = ?/?x [g(x) ? g(y) ? I(x, y)] = d/dx g(x) ? [g(y) ? I(x, y)].

second derivate for x
Ixx(x, y) = ?/?x [g(x) ? g(y) ? Ix(x, y)] = d/dx g(x) ? [g(y) ? Ix(x, y)]
---------
so it's the same for y then
Iy(x, y) = ?/?y [g(x) ? g(y) ? I(x, y)] = d/dy g(y) ? [g(x) ? I(x, y)].

Iyy(x, y) = ?/?y [g(x) ? g(y) ? Iy(x, y)] = d/dy g(y) ? [g(x) ? Iy(x, y)].
---------
And their mix:
Ixy(x,y) = ?/?y [g(x) ? g(y) ? Ix(x, y)] = d/dy g(y) ? [g(x) ? Ix(x, y)].
it can also be done the other way around (y first then x)
---------
%}
close all
%b)
impulse = zeros(25,25) ; impulse(13,13) = 255 ;
sigma = 6.0;
G = gauss(sigma);
D = gaussdx(sigma);

%impulse = impulse(:);
%First convolution with G and then convolution with GT
G1 =  conv2(G',conv2(impulse,G));

%First convolution with G and then convolution with DT
G2 =  conv2(D',conv2(impulse,G));

% First convolution with D and then convolution with GT
G3 =  conv2(G',conv2(impulse,D));

%First convolution with GT and then convolution with D
G4 =  conv2(D,conv2(impulse,G'));

%First convolution with DT and then convolution with G
G5 = conv2(G,conv2(impulse,D'));

figure()
colormap gray
subplot(2,3,1); imagesc(impulse);title("Impulse");
subplot(2,3,2); imagesc(G1);title("G,Gt");
subplot(2,3,3); imagesc(G2);title("G,Dt");
subplot(2,3,4); imagesc(G3);title("D,Gt");
subplot(2,3,5); imagesc(G4);title("Gt,D");
subplot(2,3,6); imagesc(G5);title("Dt,G");

%c
I = imread('museum.jpg');
I = rgb2gray(I);
sigma=1;
[Ix, Iy] = image_derivatives(I,sigma);
[Ixx, Iyy, Ixy] = image_derivatives2(I,sigma);
[mag, ang] = gradient_magnitude(I,sigma);
figure()
colormap gray
subplot(2,4,1); imagesc(I);title("Original");
subplot(2,4,2); imagesc(Ix);title("Ix");
subplot(2,4,3); imagesc(Iy);title("Iy");
subplot(2,4,4); imagesc(mag);title("Imag");
subplot(2,4,5); imagesc(Ixx);title("Ixx");
subplot(2,4,6); imagesc(Iyy);title("Iyy");
subplot(2,4,7); imagesc(Ixy);title("Ixy");
subplot(2,4,8); imagesc(ang);title("Dir");


