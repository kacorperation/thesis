function balls = superUrnBallMatrix(matrix,ballMatrix)
    n=size(matrix,2);
    balls=zeros(2,n);
    for i=1:n
        %total number of reds in super urn i
        redTotal=ballMatrix(1,i);
        %total number of blacks in super urn i
        blackTotal=ballMatrix(2,i);
        for j=1:n
            if matrix(i,j)==1
                redTotal=redTotal+ballMatrix(1,i);
                blackTotal=blackTotal+ballMatrix(2,i);
            end
        end
        balls(1,i)=redTotal;
        balls(2,i)=blackTotal;
    end
end
