function delta = infectednessAndCentrality(budget,matrix,ballMatrix,n,centralityMatrix)
    delta=zeros(1,n);
    infectedness=superUrnInfectedness(matrix,ballMatrix);
    for i=1:n
        delta(i)=budget*infectedness(i)*centralityMatrix(i);
    end
    delta=budget*delta/sum(delta);
    delta=properRounder(budget,delta);
end

