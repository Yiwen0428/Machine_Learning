function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
% function [w]=grdescent(func,w0,stepsize,maxiter,tolerance)
%
% INPUT:
% func function to minimize
% w0 = initial weight vector 
% stepsize = initial gradient descent stepsize 
% tolerance = if norm(gradient)<tolerance, it quits
%
% OUTPUTS:
% 
% w = final weight vector
%

if nargin<5,tolerance=1e-02;end;

w=w0;
[loss,gr]=func(w);
i=1;
while(norm(gr)>=tolerance && i<=maxiter)
    w1 = w - stepsize*gr;
    [loss1,gr1]=func(w1);
    if loss1<loss
        stepsize = stepsize*1.01;
        w=w1;
    else
        stepsize = stepsize*0.5;
    end
    
    [loss,gr]=func(w);
    i = i+1;
    
end
