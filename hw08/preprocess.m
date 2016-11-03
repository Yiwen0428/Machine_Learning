function [xTr,xTe,u,m]=preprocess(xTr,xTe);
% function [xTr,xTe,u,m]=preprocess(xTr,xTe);
%
% Preproces the data to make the training features have zero-mean and
% standard-deviation 1
%
% output:
% xTr - pre-processed training data 
% xTe - pre-processed testing data
% 
% u,m - any other data should be pre-processed by x-> u*(x-m)
%
[~,n1] = size(xTr);
meanTr = mean(xTr,2);
stdTr = std(xTr,0,2);
u = diag(1./stdTr);
m = meanTr;
xTr = u*(xTr - repmat(m, 1, n1));
%xTr = diag(1./stdTr)*(xTr - repmat(meanTr,1,n1));


[~,n2] = size(xTe);
xTe = u*(xTe - repmat(m, 1, n2));




