function ybar=computeybar(xTe)
% function [ybar]=ybar(xTe);
% 
% computes the expected label 'ybar' for a set of inputs x
% generated from two standard Normal distributions (one offset by OFFSET in
% both dimensions.)
%
% INPUT:
% xTe | a 2xn matrix of column input vectors
% 
% OUTPUT:
% ybar | a 1xn vector of the expected label ybare(x)
%

global OFFSET;

[~,n]=size(xTe);
ybar=zeros(1,n);


% Feel free to use the following function to compute p(x|y)
normpdf=@(x,mu,sigma)   exp(-0.5 * ((x - mu)./sigma).^2) ./ (sqrt(2*pi) .* sigma);

pa1 = normpdf(xTe,zeros(2,n),ones(2,n));
pa2 = normpdf(xTe,ones(2,n)*OFFSET,ones(2,n));

pb1 = pa1(1,:).*pa1(2,:);
pb2 = pa2(1,:).*pa2(2,:); 

py1= pb1./(pb1+pb2);
py2= pb2./(pb1+pb2);

ybar = py1 +2*py2;


