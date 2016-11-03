
function BDT=boosttree(x,y,nt,maxdepth)
% function BDT=boosttree(x,y,nt,maxdepth)
%
% Learns a boosted decision tree on data x with labels y.
% It performs at most nt boosting iterations. Each decision tree has maximum depth "maxdepth".
%
% INPUT:
% x  | input vectors dxn
% y  | input labels 1xn
% nt | number of trees (default = 100)
% maxdepth | depth of each tree (default = 3)
%
% OUTPUT:
% BDT | Boosted DTree
%


%% fill in code here

if nargin<3,
    nt = 10;
end;
if nargin<4,
    maxdepth = 4;
end;

[d, n]  = size(x);
weights = ones(1, n)./n;
H = @(xTe) zeros(1, size(xTe, 2));

sumAlphas = 0;

for t = 1 : nt,
	T = id3tree(x, y, maxdepth, weights);
	h = @(xTe) evaltree(T, xTe);
	hx = h(x);

	err = sum((hx ~= y) .* weights) / sum(weights);
	%% what if err == 0??
	if err > 0.5, break; end; 
	if err <=0,
		alpha = 1;
		sumAlphas += alpha;
		H = @(xTe) H(xTe) +  alpha .* h(xTe);
		break;
	end

	alpha = 1/2*log((1 - err)/err);
	sumAlphas += alpha;

	H = @(xTe) H(xTe) +  alpha .* h(xTe);

	delta_hxy = sign(hx==y * 2 - 1);
	weights = weights .* exp(- alpha .* delta_hxy) / 2 /sqrt((1 - err)*err);
	weights = weights ./ sum(weights);
end

if sumAlphas == 0,
	sumAlphas = 1;
end

H = @(xTe) H(xTe) / sumAlphas;

BDT = @(xTe) H(xTe);

