function delta=nodeDegree(budget,matrix,n)
    delta=zeros(1,n);
    for i=1:n
        delta(i)=sum(matrix(i,:))/sum(matrix(:));
    end
    delta=properRounder(budget,budget*delta);
end