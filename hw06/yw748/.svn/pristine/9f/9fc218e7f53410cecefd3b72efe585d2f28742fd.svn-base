function preds = classifyLinear(x,w,b);
% function preds=classifyLinear(x,w,b);
%
% Make predictions with a linear classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% w : weight vector (dx1)
% b : bias (scalar)
%
% Output:
% preds: predictions (1xn)
%
[d,n]=size(x)
% if no bias is given, set it to zero
if nargin<3,
	b=0;
end;

%% fill in code here
X=[x;ones(1,n)];
W=[w;b];
preds=sign(W'*X);

