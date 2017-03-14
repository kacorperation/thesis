%returns an n,1 vector that has all the
%centralities ordered
function x=eigenCentrality(V,D)

[max_eig,ind]=max(diag(D));
x=-V(:,ind); %The eigenvector centrality results
x=x/sum(x);  %Normalization so the sum of the adjacencies will equal 1 This may cause some 0's to appear