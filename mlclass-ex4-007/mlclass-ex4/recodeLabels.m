function recodedMatrix=recodeLabels(y,num_labels)

%Function to recode output labels in a neural network.It takes the y column 
%vector  and turns it into a y x numlabels matrix where each row represents yi e.g(num_labels=8 yi=4 so yi would be 00010000)

  m=size(y,1);
  recodedMatrix=zeros(m,num_labels); 
  I=eye(num_labels);
  recodedMatrix=I(y,:);



end

