%n is the number of nodes
%numBalls is the number of balls being placed to the n nodes
function x=uniformlyDistribute(n,numBalls)
    p=0;
    x=zeros(1,n);
    while p<numBalls
        k=1+floor(n*rand(1)); %Randomly choose a node
        x(1,k)=x(1,k)+1; %add a ball to the randomly chosen node
        p=p+1;
    end