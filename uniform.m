function delta=uniform(n,numBalls)
    delta=unidrnd(numBalls,1,n)/n;
    delta=properRounder(numBalls,delta);
end