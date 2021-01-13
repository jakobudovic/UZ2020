function y = project(x, U, Mu)
y = U' * (double(x) - Mu);