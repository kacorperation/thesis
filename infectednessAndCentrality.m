function delta = infectednessAndCentrality(budget,matrix,ballMatrix)
    n=size(matrix,2);
    delta=zeros(1,n);
    infectedness=superUrnInfectedness(matrix,ballMatrix);
    centrality=transpose(eigenCentrality(matrix));
    for i=1:n
        delta(i)=budget*infectedness(i)*centrality(i);
    end
    delta=budget*delta/sum(delta);
    delta=properRounder(budget,delta);
end

