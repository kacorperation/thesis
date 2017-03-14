%does polya draw process for one time step
%matrix is the adjacency matrix and ballMatrix is the matrix of balls
%deltaX is how many balls of colorx to add once colorX is drawn
%delta returns a 2 by n matrix, like ballMatrix, showing
%which balls have been drawn from each urn (so if delta(2,3)=1, the third
%urn had a black ball drawn)
function delta=draw(matrix,ballMatrix)
    n=size(matrix,2);
    delta=zeros(2,n);
    %numBalls is the number of balls in matrix i's super urn. Row 1
    %is red balls and row 2 is black balls
    %go through each node's super urn
    for i=1:n
        %add the number of balls in node i to numBalls variable
        %numBalls=ballMatrix(:,i);
        %infectedRatio is the number of red balls in super urn of node i divided by
        %the total number of balls in super urn of i
        %fill numBalls matrix
       %{
        for j=1:n
            if matrix(i,j)==1
                numBalls=numBalls+ballMatrix(:,j);
            end
        end
        %}

        numBalls = matrix(i,:)*transpose(ballMatrix);
        
        infectedRatio=numBalls(1)/sum(numBalls);
        if rand(1)<=infectedRatio
            delta(1,i)=1;
        else
            delta(2,i)=1;
        end
    end