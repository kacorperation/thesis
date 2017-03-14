%outputs infectedness ratio of each urn's super urn
function infectedness = superUrnInfectedness(matrix,ballMatrix)
    n=size(matrix,2);
    infectedness=zeros(1,n);
    for i=1:n
        %total number of reds in super urn i
        %redTotal=ballMatrix(1,i);
        %total number of blacks in super urn i
        %blackTotal=ballMatrix(2,i);
        %number of balls in super node i
        numBalls = matrix(i,:)*transpose(ballMatrix);
        %{
        for j=1:n
            if matrix(i,j)==1
                redTotal=redTotal+ballMatrix(1,i);
                blackTotal=blackTotal+ballMatrix(2,i);
            end
        end
        %}
        %infectedness(i)=redTotal/(redTotal+blackTotal);
        infectedness(i) = numBalls(1)/sum(numBalls);
    end
end

