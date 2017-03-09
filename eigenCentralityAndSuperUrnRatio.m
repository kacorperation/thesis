function delta= eigenCentralityAndSuperUrnRatio(budget,matrix,ballMatrix,n)
    %each column is the super urn's infectedness ratio
    delta=zeros(1,n);
    superUrnRatios=superUrnInfectedness(matrix,ballMatrix);
    centalityScores=transpose(eigenCentrality(matrix));
    for i=1:n
        delta(i)=centalityScores(i)*superUrnRatios(i)/sum(superUrnRatios);
    end
    delta=delta/sum(delta);
    delta=properRounder(budget,budget*delta);
end

