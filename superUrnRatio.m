%Budget is budget allowed per round, matrix is the adjacency matrix, ball
%matrix is the matrix that holds the value of the balls
function delta=superUrnRatio(budget,matrix,ballMatrix)
    n=size(ballMatrix,2);
    delta=zeros(1,n);
    %infectedness ratio's i'th column shows the infectedness ratio of node
    %i's super urn
    infectednessRatio=superUrnInfectedness(matrix,ballMatrix);
    totalSuperUrnRatio=sum(sum(infectednessRatio));
    for i=1:n
        delta(i)=budget*infectednessRatio(i)/totalSuperUrnRatio;
    end
    delta=properRounder(budget,delta);
end