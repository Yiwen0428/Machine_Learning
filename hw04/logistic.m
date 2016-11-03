function [loss,gradient]=logistic(w,xTr,yTr)
% function w=logistic(w,xTr,yTr)
%
% INPUT:
% xTr dxn matrix (each column is an input vector)
% yTr 1xn matrix (each entry is a label)
% w weight vector (default w=0)
%
% OUTPUTS:
% 
% loss = the total loss obtained with w on xTr and yTr
% gradient = the gradient at w
%

[d,n]=size(xTr);

A=yTr.*(w'*xTr);
loss = sum(log(ones(1,n) + exp(-A)));
B=repmat(yTr,d,1).*xTr;
C=(ones(1,n)+exp(yTr.*(w'*xTr)));
gradient = -sum((B./repmat(C,d,1))')';