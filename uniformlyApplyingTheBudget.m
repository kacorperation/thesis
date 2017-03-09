function delta=uniformlyApplyingTheBudget(budget,matrix,n)
    checker=matrix;
    for i=1:budget
        matrix(1,mod(i,n)+1)= matrix(1,mod(i,n)+1)+1;
    end
    delta=zeros(1,n);
    for i=1:n
        delta(i)=matrix(1,i)-checker(1,i);
    end
