function T=id3tree(xTr,yTr,maxdepth,weights)
% function T=id3tree(xTr,yTr,maxdepth,weights)
%
% The maximum tree depth is defined by "maxdepth" (maxdepth=2 means one split).
% Each example can be weighted with "weights".
%
% Builds an id3 tree
%
% Input:
% xTr | dxn input matrix with n column-vectors of dimensionality d
% yTr | 1xn input matrix
% maxdepth = maximum tree depth
% weights = 1xn vector where weights(i) is the weight of example i
%
% Output:
% T = decision tree
%

%% fill in code here

[d,n]=size(xTr);

if nargin<3,
    maxdepth = Inf;
    q = 2^3 - 1;
else
	q = 2^maxdepth - 1;
end;
if nargin<4,
    weights=ones(1,n)./n;
end;

T = zeros(6, q);

T = buildTree(T, 0, 1, xTr, yTr, weights, 1, maxdepth);
end

function Tree = buildTree(T, root, node, xTr, yTr, weights, depth, maxdepth)
	[feature, cut, Hbest] = entropysplit(xTr, yTr);
	Tree = T;
	lengthT = size(Tree, 2);
	lengthNeed = 2 ^ depth - 1;
	if lengthNeed > lengthT,
		Tree = [Tree, zeros(6, lengthNeed - lengthT)];
	end
	
	Tree(1, node) = mode(yTr);
	Tree(2, node) = feature;
	Tree(3, node) = cut;

	nX = size(xTr, 2);

	if feature == 0 || depth >= maxdepth || nX <= 1,
		Tree(4, node) = 0;
		Tree(5, node) = 0;
	else,
		left = node*2;
		Tree(4, node) = left;
		leftIdx = find(xTr(feature, :) <= cut);
		Tree = buildTree(Tree, node, left, xTr(:, leftIdx), ...
			            yTr(1, leftIdx), weights, depth+1, maxdepth);
		right = node*2 + 1;
		Tree(5, node) = right;
		rightIdx = find(xTr(feature, :) > cut);
		Tree = buildTree(Tree, node, right, xTr(:, rightIdx),...
		                 yTr(1, rightIdx), weights, depth+1, maxdepth);
	end

	Tree(6, node) = root;
end



