function [posprob,negprob] = naivebayesPXY(x,y)
% function [posprob,negprob] = naivebayesPXY(x,y);
%
% Computation of P(X|Y)
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1) (1xn)
%
% Output:
% posprob: probability vector of p(x|y=1) (dx1)
% negprob: probability vector of p(x|y=-1) (dx1)
%

% add one all-ones positive and negative example
[d,n]=size(x);
x=[x ones(d,2)];
y=[y -1 1];

[d,n] = size(x);
%% fill in code here
y0=repmat(y,d,1);
y1=y0;y2=y0;
y1(find(y1<0))=0;
y2(find(y2>0))=0;
x1=x.*y1;
x2=x.*y2;

posprob=sum(x1'>0)'/sum(sum(x1'>0)');
negprob=sum(x2'<0)'/sum(sum(x2'<0)');
