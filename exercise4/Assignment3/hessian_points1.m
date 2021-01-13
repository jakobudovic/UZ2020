function [px,py, I_hess] = hessian_points1(I, sigma, threshold )
[Ixx,Iyy,Ixy] = image_derivatives2(I,sigma);
I_hess = sigma^4*(Ixx.*Iyy-Ixy.^2);
I_hess1 = (I_hess>threshold).*I_hess;
%dobimo pike, sedaj rabimo pogledat sosede
%threshold
fun = @(x) x(5)*all(x(5) > x([1,2,3,4,6,7,8,9]));
I_hess1 = nlfilter(I_hess1, [3 3], fun);
[py,px] = find(I_hess1);