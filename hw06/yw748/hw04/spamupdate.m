function w=spamupdate(w,email,truth);
%	function w=spamupdate(w,email,truth);
%
% Input:
% w 	weight vector
% email instance vector
% truth label
%
% Output:
%
% updated weight vector

% INSERT CODE HERE:
k=6;

if (w' * email) * truth <= 0
    w = w + k*truth * email;
end

% maxiter= 5000;
% f=@(w) ridge(w,email,truth,1);
% 
% tolerance=1e-02;
% [loss,gr]=f(w);    
% 
% i=1;
% while(norm(gr)>=tolerance && i<=maxiter)
%     stepsize = 1/i;
%     w = w - stepsize*gr;
%     [loss,gr]=f(w);    
%     i = i+1;    
% end






