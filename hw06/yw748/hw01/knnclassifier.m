function preds=knnclassifier(xTr,yTr,xTe,k);
% function preds=knnclassifier(xTr,yTr,xTe,k);
%
% k-nn classifier 
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
% k = number of nearest neighbors to be found
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%


% output random result as default (you can erase this code)
[d,n]=size(xTe);
[d,ntr]=size(xTr);
if k>ntr,k=ntr;end;

%currently assigning random predictions
% un=unique(yTr);
% preds=un(ceil(rand(1,n)*length(un)));

%% fill in code here
[indices,dists]=findknn(xTr,xTe,k);
M = yTr(indices);
if n==1;
    M=M';
end

if k==1
preds = M;

elseif k==2
preds = M(1:1,:);


else    
[preds,F,C] = mode(M);   
[Cnrows,~] = cellfun(@size, C)

Cnrows1=Cnrows;
Cnrows2=Cnrows;
Cnrows1(Cnrows1~=1)=0;
Cnrows2(Cnrows2==1)=0;
Cnrows2(Cnrows2~=0)=1;

% for? 
preds = preds.*Cnrows1+mode(M(1:k-1,:)).*Cnrows2;
end





