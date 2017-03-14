function delta=degreeAndSuperUrnRatio(budget,matrix,ballMatrix,n,degreeMatrix)
    delta=zeros(1,n);
    superUrnRatios=superUrnRatio(budget,matrix,ballMatrix,n);
    for i=1:n
        delta(i)=superUrnRatios(i)*degreeMatrix(i);
    end
    delta=properRounder(budget,budget*delta/sum(delta));
end