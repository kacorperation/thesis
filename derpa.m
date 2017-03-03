function k=derpa(matrix)
c=transpose(eigenCentrality(matrix));
n=size(matrix,2);
t=zeros(1,n);
for j=1:n
        t(j)=1.0000/c(j);
end
sumOft=sum(t)/1.0000;
for j=1:n
        t(j)=t(j)/sumOft/1.0000;
end
k=t;