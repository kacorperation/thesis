function delta= eigenCentralityAndSuperUrnRatio(budget,matrix,ballMatrix)
    %each column is the super urn's infectedness ratio
    n=size(matrix,2);
    superUrnRatios=superUrnInfectedness(matrix,ballMatrix);
    urnInfectednessSum=sum(superUrnRatios);
    centalityScores=transpose(eigenCentrality(matrix));
    delta=zeros(1,n);
    for i=1:n
        delta(i)=budget*superUrnRatios(i)/urnInfectednessSum*centalityScores(i);
    end
    delta=properRounder(budget,delta);
end

