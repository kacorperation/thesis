function delta = degreeCentralitySuperUrn( budget,matrix,ballMatrix,n,centralityMatrix,adjmatrix)
delta=zeros(1,n);
%centrality
%degree
i=1:1:n;
degree=sum(matrix(i,:));
%superUrnInfectedRatio
infectedness=superUrnInfectedness(adjmatrix,ballMatrix);
for i=1:n
    delta(i)=centralityMatrix(i)*degree(i)*infectedness(i);
end
%normalize
delta=delta/sum(delta);
delta=properRounder(budget,budget*delta);

