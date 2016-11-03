function w=perceptron(x,y);
% function w=perceptron(x,y);
%
% Implementation of a Perceptron classifier
% Input:
% x : n input vectors of d dimensions (dxn)
% y : n labels (-1 or +1)
%
% Output:
% w : weight vector
%

[d,n]=size(x);
w=zeros(d,1);

%% fill in code here
for i=1:100
    A=randperm(n);
%     x(:,A);
%     y(:,A);
    m=0;
    for j=1:n
        if y(:,A(j))*w'*x(:,A(j))<=0
            w=w+y(:,A(j))*x(:,A(j));
            m=m+1;
        end

    end
    if  m==0;
        break;
    end
end
