function delta= eigenCentralityAndSuperUrnRatio(budget,matrix,ballMatrix,n,centralityMatrix)
    %each column is the super urn's infectedness ratio
    delta=zeros(1,n);
    superUrnRatios=superUrnInfectedness(matrix,ballMatrix);
    for i=1:n
        delta(i)=centralityMatrix(i)*superUrnRatios(i)/sum(superUrnRatios);
    end
    delta=delta/sum(delta);
    delta=properRounder(budget,budget*delta);
end

