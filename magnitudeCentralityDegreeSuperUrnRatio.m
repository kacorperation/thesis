function delta = magnitudeCentralityDegreeSuperUrnRatio( budget,n,centralityScores,matrix,ballMatrix,degreeMatrix )
delta=zeros(1,n);
amount=zeros(1,n);
infection=superUrnInfectedness(matrix,ballMatrix);
for i=1:n
    amount(i)=1/(ballMatrix(1,i)+ballMatrix(2,i));
end
amount=amount/sum(amount);
for i=1:n
    delta(i)=amount(i)*centralityScores(i)*infection(i)*degreeMatrix(i);
end
delta=properRounder(budget,budget*delta/sum(delta));

