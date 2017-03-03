function x=centrallyDistribute(matrix,numBalls)
    n=size(matrix,2);
    c=transpose(eigenCentrality(matrix)); %Find centrality of nodes
    x=zeros(1,n);
    display(c);
    display(sum(c));
    %loop keeps going until all balls in numBalls are placed
    for p=1:1:numBalls
        %Matrix that will store indexes
        indexMatrix=zeros(1,n);
        for j=1:n
            indexMatrix(j)=j;
        end
        randomVariable=rand(1);
        collectiveSum=0.0000;
        %checks if a ball has been placed
        flag=0;
        %keep going until a flag is placed
        while flag==0
            index=randi([1 size(indexMatrix,2)],1);
            collectiveSum=(collectiveSum+c(index))/1.0000;
            %place ball
            if collectiveSum>=randomVariable
                x(index)=x(index)+1;
                flag=1;
            %delete the index,go back to beginning of the loop
            else
                indexMatrix(index)=[];
            end
        end
    end
    
    