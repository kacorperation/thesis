%find the most infected node(s) if there are ties, figure out which 
%most infected node is central, then put all black balls there
function delta=cureMostInfectedNode(budget,ballMatrix,n)
    [value index]=max(ballMatrix(1,:));
    delta=zeros(1,n);
    delta(index)=budget;
end