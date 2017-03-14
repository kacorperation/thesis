function delta = magnitudeDegreeSuperUrnRatio(budget,matrix,ballMatrix,degreeMatrix,n)
delta=zeros(1,n);
%superUrnMatrix
infection=superUrnInfectedness(matrix,ballMatrix);
%amount is the magnitudes matrix
amount=zeros(1,n);
for i=1:n
    amount(i)=1/(ballMatrix(1,i)+ballMatrix(2,i));
end
amount=amount/sum(amount);
for i=1:n
    delta(i)=degreeMatrix(i)*infection(i)*amount(i);
end
delta=properRounder(budget,budget*delta/sum(delta));

