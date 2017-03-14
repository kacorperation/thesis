function degreeMatrix = degree(matrix,n)
degreeMatrix=zeros(1,n);
for i=1:n
        degreeMatrix(i)=sum(matrix(i,:))/sum(matrix(:));
end

