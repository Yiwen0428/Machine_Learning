function [loss,gradient]=hinge(w,xTr,yTr,lambda)
% function w=ridge(xTr,yTr,lambda)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% lambda regression constant
% w weight vector (default w=0)
%
% OUTPUTS:
%
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);

A=ones(1,n)-yTr.*(w'*xTr);
A(A<0)=0;

loss = sum(A) + lambda*(w'*w);

A(A>0)=1;
Y=repmat(yTr,d,1);
A=repmat(A,d,1);
gradient = -sum((A.*(Y.*xTr))')' + 2*lambda*w;
