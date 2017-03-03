function differences = ballDifference(matrix,ballMatrix)
    n=size(matrix,2);
    %differences will store the difference between R and B in each super
    %urn
    differences=zeros(1,n);
    superUrnBalls=superUrnBallMatrix(matrix,ballMatrix);
    for i=1:n
        if(superUrnBalls(1,i)-superUrnBalls(2,i)~=0)
            differences(i)=1/abs(superUrnBalls(1,i)-superUrnBalls(2,i));
        else
            differences(i)=2;
        end
    end
    %normalize differences
    differences=differences/sum(differences);
end

