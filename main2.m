%{
A is the adjacency matrix
initial is the initial conditions where
    row1=# of reds
    row2#of blacks
    columns are the urns
    initial has at least one red and black in each urn to avoid stupid
    cases
%}
n=10; %number of nodes
%number of red balls to be added at time 0
initialRedBudget=600; 
%number of black balls to be added at time 0
initialBlackBudget=400;
%deltas are the number of balls to add at each polya urn pick (for god's
%sake keep them equal I made a mistake not making them a single variable)
delta=30;%=budget? Less? More?
deltaRed=delta;
deltaBlack=delta;
%budget per time step allowed for black balls
budget=n*deltaRed; %should this be n?
%Amount of time steps to take in each experiment
timeSteps=1000;
%amount of experiments with same initial conditions per solution method
amountOfExperiments=10;
%End of variable assignments



%matrix is the adjacency matrix
matrix=scalefree(n,3,2);

%addballs2 adds red and black balls according to specifications
%initial is the ball distribution per node at time 0
initial=ones(2,n)+addBalls2(matrix,initialRedBudget,1,initialBlackBudget,0);

%uniform distribution of balls with a/(a+b) infectedness
%initial=[50*ones(1,n);50*ones(1,n)];

%do the experiment, get the precious data
[result,deltaLossMatrix]=doExperiments(n,amountOfExperiments,timeSteps,initial,matrix,budget,deltaRed,deltaBlack);
amountOfMethods=size(result,1);



%average the deltaLossMatrix
%deltaLoss is the average loss of delta for each method
deltaLoss=zeros(1,amountOfMethods);
for i=1:amountOfMethods
    for k=1:timeSteps
        for j=1:amountOfExperiments
            deltaLoss(i)=deltaLoss(i)+deltaLossMatrix(i,j,k);
        end
    end
    deltaLoss(i)=deltaLoss(i)/amountOfExperiments/timeSteps;
end




%average data avrages the output of the doExperiments over the amount of
%experiments
averageData=averageResults(result,timeSteps,amountOfExperiments)/n;
%amountOfMethods=how many curing methods have been tested
%infectednessMatrix holds the average over the experiments'
%infectedness (E[s^{tilde}_n]of the systems in each time step including time zero
infectednessMatrix=zeros(amountOfMethods,timeSteps+1);
%initial average number of reds and blacks
initialRed=sum(initial(1,:))/n;
initialBlack=sum(initial(2,:))/n;
%populate initial time step
for i=1:amountOfMethods
    infectednessMatrix(i,1)=initialRed/(initialBlack+initialRed);
end
%stores Sn, where S_n=infection ratio is average at time n 
%of S_{i,n} over all urns from n=2 to n=timeSteps
%this is done for all control methods, 
%so sMatrix(i,j) is the S_{j+1} for control method i
sMatrix=zeros(amountOfMethods,timeSteps);
%populate sMatrix
for i=1:amountOfMethods
    for j=1:timeSteps
        %calculate S_{i,n} as seen in page 3
        sum1=0;
        sum2=0;
        for k=1:j
            %sum(Z_{i,t}*delta)
            sum1=sum1+averageData(i,k)*delta;
            %sum delta
            sum2=sum2+averageData(i,k)*delta+(1-averageData(i,k))*delta;
        end
        sMatrix(i,j)=(initialRed+sum1)/(initialRed+initialBlack+sum2);
    end
end
for i=1:amountOfMethods
    %calculate sum(S_{i,n})
    for j=2:timeSteps+1
        sum1=0;
        for k=1:j-1
            %sum S_{i,n}
            sum1=sum1+sMatrix(i,k);
        end
        infectednessMatrix(i,j)=sum1/(j-1);%or j-1? How does 0th first time steps work?
    end
end