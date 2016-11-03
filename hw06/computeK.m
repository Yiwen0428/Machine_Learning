function K = computeK(kernel_type, X, Z, param)
% function K = computeK(kernel_type, X, Z)
% computes a matrix K such that Kij=g(x,z);
% for three different function linear, rbf or polynomial.
%
% Input:
% kernel_type: either 'linear','polynomial','rbf'
% X: n input vectors of dimension d (dxn);
% Z: m input vectors of dimension d (dxn);
% param: kernel parameter (inverse kernel width gamma in case of RBF, degree in case of polynomial)
%
% OUTPUT:
% K : nxm kernel matrix
%
%
[~,n] = size(X);
[~,m] = size(Z);

if nargin<2,
	Z=X;
end;

if strcmp(kernel_type,'linear') == 1
    K = X' * Z;
end

if strcmp(kernel_type,'poly') == 1
    K = (X'*Z+ones(n,m)).^ param;
end

if strcmp(kernel_type,'rbf') == 1
    K = exp(-param*(l2distance(X,Z)).^2);
end