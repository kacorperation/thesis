%matrix is the adjacency matrix
function delta=degreeAndInfectedness(budget,matrix,ballMatrix)
    n=size(matrix,2);
    delta=zeros(1,n);
    denomenator=0;
    %calculate denomenator
    for i=1:n
        neighbors=sum(matrix(:,i));
        ratioOfInfectedness=ballMatrix(1,i)/(ballMatrix(1,i)+ballMatrix(2,i));
        denomenator=denomenator+neighbors*ratioOfInfectedness;
    end
    for i=1:n
        neighbors=sum(matrix(:,i));
        ratioOfInfectedness=ballMatrix(1,i)/(ballMatrix(1,i)+ballMatrix(2,i));
        delta(i)=budget*neighbors*ratioOfInfectedness/denomenator;
    end
    delta=properRounder(budget,delta);
end