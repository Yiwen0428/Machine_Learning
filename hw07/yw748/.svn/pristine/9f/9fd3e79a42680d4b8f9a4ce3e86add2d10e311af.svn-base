function F=forest(x,y,nt)
% function F=forest(x,y,nt)
%
% INPUT:
% x | input vectors dxn
% y | input labels 1xn
%
% OUTPUT:
% F | Forest
%

%% fill in code here

[~, n] = size(x);

if nargin < 3,
    nt = 10;
end;
F = cell(nt, 1);

for ii = 1 : nt,
	index = randi(n, 1, n);
	T = id3tree(x(:, index), y(1, index), 4);
	F(ii) = T;
end;

end;