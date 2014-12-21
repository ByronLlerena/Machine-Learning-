function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%

set=[0.01;0.03;0.1;0.3;1;3;10;30];
m=size(set,1);
error=zeros(m,m);

for i=1:size(set)

	for j=1:size(set)
                C=set(i); 
                sigma=set(j); 
		model=svmTrain(X,y,C,@(x1,x2) gaussianKernel(x1,x2,sigma));  
                predictions=svmPredict(model,Xval); 
                error(i,j)=mean(double(predictions~=yval));
printf("Training number[%f,%f] with value C=%f and sigma=%f\n",i,j,C,sigma);
        end
   

end

	[a,b]=min(error);
[c,d]=min(a);
        column=d;
        row=b(d);
        C=set(row);
        sigma=set(column); 
  
printf("The lowest error is %f which corresponds to the values of C=%f and sigma=%f \n",error(row,column),C,sigma);
printf("The values of all error for the CV set are: \n");
error


% =========================================================================

end
