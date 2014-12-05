function[recodedMatrix]=recodeLabels(y,numberOfLabels)

%This function takes a vector of dimensions m x 1 and turns it into a matrix of
%dimensions 'numberOfLabels x m' where each value of the vector is a column
%of the new matrix e.g(for a vector where the num of labels are 10  8 = 0000000100)

m=size(y,1);

recodedMatrix=zeros(numberOfLabels,m);

%aux=recodedMatrix;

%for i=1:m

<<<<<<< HEAD
 %n=y(i);
=======
% n=y(i);
>>>>>>> 48b27942c8e83fd34212f2b72ca2fd2bb2a8964a
% aux(n,i)=1;


%end

%recodedMatrix=aux;

<<<<<<< HEAD

%The above implementation is making use of a for loop. This one right here will use a more efficient way.

I=eye(numberOfLabels);
recodedMatrix=(I(y,:))';
=======
I=eye(numberOfLabels);
recodedMatrix=I(y,:)';
>>>>>>> 48b27942c8e83fd34212f2b72ca2fd2bb2a8964a


end
