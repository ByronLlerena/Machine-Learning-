Afunction [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
costFunction=0;

%Initialization of matrices

m=size(X,1);
a1=zeros(m,1+hidden_layer_size);
yRecoded=zeros(m,num_labels);
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));
Theta1Aux=zeros(hidden_layer_size,input_layer_size);
Theta2Aux=zeros(num_labels,hidden_layer_size);
                 

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

		  %Data:
                  %X=inputs (5000 x 400) matrix
                  %a1=inputs and the bias (5000 x 401)matrix
                  %Theta1 (25 x 401) matrix
                  %Theta2 (10 x 26) matrix
                  %z2 (5000 x 25) matrix
                  %a2 (5000 x 26) matrix bias included
                  %z3 (5000 x10) matrix
                  %a3 (5000 x10) matrix
 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PART1 FEEDFOWARD FOR ALL X % 
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%
		

                                   

                  a1=[ones(m,1) X];
                  
                  z2= a1*Theta1'; % (5000 x 25) matrix

                  a2=sigmoid(z2);
 
                  a2=[ones(m,1) a2]; %(5000 x 26) matrix

                  z3= a2*Theta2'; %5000 x 10 matrix

                  a3=sigmoid(z3); %5000 x 10 matrix


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PART2 COST FUNCTION WITH REGULARIZATON %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


                  yRecoded=recodeLabels(y,num_labels);% (5000 x 10) matrix
		  costFunction=(1/m)*(-(log(a3).*yRecoded)-(1.-yRecoded).*(log(1.-a3)));%Scalar without reg
		  costFunction=sum(costFunction(:));
                  Theta1Aux=Theta1(:,2:end);
                  Theta2Aux=Theta2(:,2:end);                          
                  regularization=(lambda/(2*m))*(sum(sumsq(Theta1Aux))+sum(sumsq(Theta2Aux))); 
                  J=costFunction+regularization; 


%%%%%%%%%%%%%%%%%%%%%%
% 3 BACK PROPAGATION %
%%%%%%%%%%%%%%%%%%%%%

%%Initialization of matrices.

delta_3=zeros(m,num_labels);
delta_2=zeros(m,hidden_layer_size);
Theta1=randInitializeWeights(input_layer_size,hidden_layer_size);
Theta2=randInitializeWeights(hidden_layer_size,num_labels);
g2=zeros(size(z2));
D1=zeros(size(Theta1));
D2=zeros(size(Theta2));

%%Back Propagation Algorithm (Vectorized)

delta_3=a3-yRecoded; % (5000 x 10) matrix
g2=sigmoidGradient(z2);%(5000 x 25) matrix
delta_2=(delta_3*Theta2Aux).*g2; %(5000 x 25) matrix

D1=delta_2'*a1;% 25 x 401 matrix 
D2=delta_3'*a2; % 10 x 26  matrix

% -------------------------------------------------------------

% =========================================================================



Theta1_grad(:,1)=D1(:,1)*(1/m);
Theta2_grad(:,1)=D2(:,1)*(1/m);

  Theta1_grad(:,2:end)=(D1(:,2:end)/m)+(lambda/m)*Theta1(:,2:end);
Theta2_grad(:,2:end)=(D2(:,2:end)/m)+(lambda/m)*Theta2(:,2:end);

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
