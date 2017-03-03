function delta = differencesCentralitySuperUrnInfectedness( budget,matrix,ballMatrix )
    n=size(matrix,2);
    delta=zeros(1,n);
    infectedness=superUrnInfectedness(matrix,ballMatrix);
    differences=ballDifference(matrix,ballMatrix);
    centrality=transpose(eigenCentrality(matrix));
    for i=1:n
        delta(i)=centrality(i)*differences(i)*infectedness(i); %does not add up to 1
    end
    delta=budget*delta/sum(delta);
    delta=properRounder(budget,delta);
end

