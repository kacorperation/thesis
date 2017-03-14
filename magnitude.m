function delta = magnitude(budget,ballMatrix,n)
delta=zeros(1,n);
for i=1:n
    delta(i)=1/(ballMatrix(1,i)+ballMatrix(2,i));
end
delta=delta/sum(delta);
delta=properRounder(budget,budget*delta);
end

