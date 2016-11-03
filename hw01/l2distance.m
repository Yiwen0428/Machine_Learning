function D=l2distance(X,Z)
% function D=l2distance(X,Z)
%	
% Computes the Euclidean distance matrix. 
% Syntax:
% D=l2distance(X,Z)
% Input:
% X: dxn data matrix with n vectors (columns) of dimensionality d
% Z: dxm data matrix with m vectors (columns) of dimensionality d
%
% Output:
% Matrix D of size nxm 
% D(i,j) is the Euclidean distance of X(:,i) and Z(:,j)
%
% call with only one input:
% l2distance(X)=l2distance(X,X)
%

if (nargin==1) % case when there is only one input (X)
	%% fill in code here
    D = l2distance(X, X);


else  % case when there are two inputs (X,Z)
    %% fill in code here
%     S = repmat(diag(innerproduct(X)),1,m);
%     R =( repmat(diag(innerproduct(Z)),1,n)).';
    [d,n]=size(X); % dimension of X
    [~,m]=size(Z); % number of input vectors in Z
    
    G = innerproduct(X,Z);
    
     if d==1
         S = repmat( (X.*X)',1,m);
         R = repmat(Z.*Z,n,1);
     else
     S = repmat(sum(X.*X)',1,m);
     R = repmat(sum(Z.*Z),n,1);
     end
    
    
    D = sqrt(abs(S - 2*G +R));

end;
%



