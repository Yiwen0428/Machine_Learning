function preds = classifyLinear(x,w,b);
% function preds=classifyLinear(x,w,b);
%
% Make predictions with a linear classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% w : weight vector
% b : bias
%
% Output:
% preds: predictions
%

%% fill in code here
[~,n]=size(x);
preds=w'*x+b*ones(1,n);
preds(preds>0)=1;
preds(preds<=0)=-1;
   

