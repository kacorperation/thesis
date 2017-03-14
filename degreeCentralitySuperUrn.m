function delta = degreeCentralitySuperUrn( budget,matrix,ballMatrix,n,V,D,adjmatrix)
delta=zeros(1,n);
%centrality
centralityScores=transpose(eigenCentrality(V,D));
%degree
i=1:1:n;
degree=sum(matrix(i,:));
%superUrnInfectedRatio
infectedness=superUrnInfectedness(adjmatrix,ballMatrix);
for i=1:n
    delta(i)=centralityScores(i)*degree(i)*infectedness(i);
end
%normalize
delta=delta/sum(delta);
delta=properRounder(budget,budget*delta);

