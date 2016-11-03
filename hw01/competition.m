function preds=competition(xTr,yTr,xTe);
% function preds=competition(xTr,yTr,xTe);
%
% A classifier that outputs predictions for the data set xTe based on 
% what it has learned from xTr,yTr
%
% Input:
% xTr = dxn input matrix with n column-vectors of dimensionality d
% xTe = dxm input matrix with n column-vectors of dimensionality d
%
% Output:
%
% preds = predicted labels, ie preds(i) is the predicted label of xTe(:,i)
%

% The random classifier is awesome!!! Could you possibly do better?
% un=unique(yTr);
% [d,n]=size(xTe);
% preds=randi(length(un),1,n);
% 
%fill in the code here
temp=0;
acc=0;
k=0;

for i=1:20
    temp=analyze('acc',yTr,knnclassifier(xTr,yTr,xTr,i));
    if temp>acc
        acc=temp;
        k=i;
    end   
end

preds=knnclassifier(xTr,yTr,xTe,k);

