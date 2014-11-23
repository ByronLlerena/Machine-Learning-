function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================
% Instructions: Plot the positive and negative examples on a
%               2D plot, using the option 'k+' for the positive
%               examples and 'ko' for the negative examples.
%

pos=find(y==1);neg=find(y==0);% I find the positive and negative values for each student

plot(X(pos,1),X(pos,2),'k+','LineWidth',2,'MarkerSize',7);% I first plot the positive values with a mark +
plot(X(neg,1),X(neg,2),'ko','MarkerFaceColor','y','MarkerSize',7);% Plot the Negative Values with a o mark

% Put some labels 
% Labels and Legend
xlabel('Exam 1 score')
ylabel('Exam 2 score')

% Specified in plot order
legend('Admitted', 'Not admitted')
hold off;




end