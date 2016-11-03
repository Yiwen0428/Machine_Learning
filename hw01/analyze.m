function output=analyze(kind,truth,preds)	
% function output=analyze(kind,truth,preds)		
%
% Analyses the accuracy of a prediction
% Input:
% kind='acc' classification error
% kind='abs' absolute loss
% (other values of 'kind' will follow later)
% 
[m,n]=size(truth);

switch kind
	case 'abs'
		% compute the absolute difference between truth and predictions
		%fill in the code here
        output=mean(abs(truth-preds));
		
	case 'acc' 
		%% fill in code here
		 output=mean(sum((truth-preds)==0)/(m*n));	
end;
