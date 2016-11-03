function variance=computevariance(xTe,sigma, lambda,hbar)
% function variance=computevariance(xTe,OFFSET,sigma, lambda,hbar)
% 
% computes the variance of classifiers trained on data sets from
% toydata.m with pre-specified "OFFSET" and 
% with kernel regression with sigma and lambda
% evaluated on xTe. 
% the prediction of the average classifier is assumed to be stored in "hbar".
%
% The "infinite" number of models is estimated as an average over NMODELS. 
%
% INPUT:
% xTe       | 2xn matrix, of n column-wise input vectors (each 2-dimensional)
% sigma | kernel width of the RBF kernel
% lambda | regularization constant
% hbar      | 1xn vector of the predictions of hbar on the inputs xTe
% 

global Nsmall NMODELS OFFSET;

[~,n]=size(xTe);
variance=zeros(1,n);
hbar=computehbar(xTe,sigma, lambda);

for j=1:NMODELS
[xTr,yTr]=toydata(OFFSET,Nsmall); 
fun=kregression(xTr,yTr,sigma,lambda);
predictions=fun(xTe);
variance=variance+(predictions-hbar).*(predictions-hbar);

end;
variance=mean(variance)/NMODELS;

