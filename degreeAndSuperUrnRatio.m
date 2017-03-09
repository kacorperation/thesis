function delta=degreeAndSuperUrnRatio(budget,matrix,ballMatrix,n)
    delta=zeros(1,n);
    superUrnRatios=superUrnRatio(budget,matrix,ballMatrix,n);
    totalNeighbors=sum(sum(matrix));
    for i=1:n
        delta(i)=superUrnRatios(i)*sum(matrix(i,:))/totalNeighbors;
    end
    delta=budget*delta/sum(delta);
    delta=properRounder(budget,delta);
end