%delta returns a 2 by n matrix, like ballMatrix, showing
%   how many balls to add to each urn
%matrix is adjacency matrix
%numRed is the number of red balls to add
%typeRed is the way to add red balls (uniform, central etc.)
function delta = addBalls2(matrix,numRed,typeRed,numBlack,typeBlack,V,D)
    n=size(matrix,2);
    %x and y are the first and second rows of delta, respectively
    %x=zeros(1,n);
    %y=zeros(1,n);
    switch typeRed
        case 0
            x=uniform(n,numRed);
        case 1
            x=centrallyDistribute(matrix,numRed,V,D);
    end
    switch typeBlack
        case 0
            y=uniform(n,numBlack);
        case 1
            y=centrallyDistribute(matrix,numBlack);
    end
    delta=[x;y];
end

