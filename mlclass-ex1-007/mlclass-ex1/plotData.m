function plotData(x, y)
%PLOTDATA Plots the data points x and y into a new figure 
%PLOTDATA(x,y) 
%population and profit.

% ====================== YOUR CODE HERE ======================

% open a new figure window
figure;
plot(x,y,'rx','MarkerSize',10);
ylabel('Profit in $10.000s');
xlabel('Population of the city in 10.000s');

% ============================================================

end
