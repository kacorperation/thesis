function delta= eigenCentralityAndSuperUrnRatio(budget,matrix,ballMatrix,n,V,D)
    %each column is the super urn's infectedness ratio
    delta=zeros(1,n);
    superUrnRatios=superUrnInfectedness(matrix,ballMatrix);
    centalityScores=transpose(eigenCentrality(V,D));
    for i=1:n
        delta(i)=centalityScores(i)*superUrnRatios(i)/sum(superUrnRatios);
    end
    delta=delta/sum(delta);
    delta=properRounder(budget,budget*delta);
end

