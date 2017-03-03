function delta = eigenCentralityEvaluation(budget,matrix)
%Calculates delta based on eigen centrality
    %each column is the centrality score, centrality scores add up to 1
    centralityScores=transpose(eigenCentrality(matrix));
    n=size(matrix,2);
    delta=zeros(1,n);
    for i=1:n
        delta(i)=budget*centralityScores(i);
    end
    delta=properRounder(budget,delta);
end

