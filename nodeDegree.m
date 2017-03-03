function delta=nodeDegree(budget,matrix)
    n=size(matrix,2);
    total=sum(matrix(:));
    delta=zeros(1,n);
    for i=1:n
        delta(i)=budget*sum(matrix(i,:))/total;
    end
    delta=properRounder(budget,delta);
end