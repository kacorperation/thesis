%budget is budget allowed per round, ballMatrix is the matrix containing
%the number of balls in each urn
%delta is the number of balls to be added to each urn
function delta=ratioOfInfectedness(budget,ballMatrix,n)
    delta=zeros(1,n);
    denomenator=0;
    for i=1:n
        denomenator=denomenator+ballMatrix(1,i)/(ballMatrix(1,i)+ballMatrix(2,i));
    end
    for i=1:n
        numerator=ballMatrix(1,i)/(ballMatrix(1,i)+ballMatrix(2,i));
        delta(i)=numerator/denomenator;
    end
    delta=properRounder(budget,budget*delta);
end