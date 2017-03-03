%This function outputs the array described below that stores the
%effectiveness of infection prevention methods for same initial conditionsfunction
function tracker=doExperiments(n,amountOfExperiments,timeSteps,initial,matrix,budget,deltaRed,deltaBlack)
%{
Create an array tracker[a][b][c][d] with the following dimensions:
a=methodOfSolution
b=trial
c=time step

Super urn infectedness
Average z values overall
%}

%{
Here's a list of functions we'll include for the trials:
1-cureMostInfectedNode
2-degreeAndInfectedness
3-degreeAndSuperUrnRatio
4-eigenCentralityAndSuperUrnRatio
5-infectednessAndCentrality
6-nodeDegree
7-ratioOfInfectedness
8-superUrnRatio
9-uniformlyApplyingTheBudget
More will be added later
%}
amountOfMethods=9; %change this as more experiments are added

%tracker will store the average Z of a system for every experiment and
%every time step of it (ie tracker(a)(b)(c) will record method a's
%experiment number b's average Z value at time step c
tracker=zeros(amountOfMethods,amountOfExperiments,timeSteps);
for a=1:amountOfMethods
    for b=1:amountOfExperiments
        %reset the ballMatrix whenever you are doing a new experiment
        ballMatrix=initial;
        for c=1:timeSteps
            switch a
                case 1
                    delta=cureMostInfectedNode(budget,ballMatrix);
                    %add the black balls according to the control policy
                    ballMatrix=ballMatrix+[zeros(1,n);delta];
                    %(ballMatrix)
                    %do the draw process
                    delta=draw(matrix,ballMatrix,deltaRed,deltaBlack);
                    %(delta)
                    %sum all Zn
                    tracker(a,b,c)=sum(delta(1,:))/deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+delta;
                case 2
                    delta=degreeAndInfectedness(budget,matrix,ballMatrix);
                    %add the black balls according to the control policy
                    ballMatrix=ballMatrix+[zeros(1,n);delta];
                    %(ballMatrix)
                    %do the draw process
                    delta=draw(matrix,ballMatrix,deltaRed,deltaBlack);
                    %(delta)
                    %sum all Zn
                    tracker(a,b,c)=sum(delta(1,:))/deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+delta;
                case 3
                    delta=degreeAndSuperUrnRatio(budget,matrix,ballMatrix);
                    %add the black balls according to the control policy
                    ballMatrix=ballMatrix+[zeros(1,n);delta];
                    %(ballMatrix)
                    %do the draw process
                    delta=draw(matrix,ballMatrix,deltaRed,deltaBlack);
                    %(delta)
                    %sum all Zn
                    tracker(a,b,c)=sum(delta(1,:))/deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+delta;
                case 4
                    delta=eigenCentralityAndSuperUrnRatio(budget,matrix,ballMatrix);
                    %add the black balls according to the control policy
                    ballMatrix=ballMatrix+[zeros(1,n);delta];
                    %(ballMatrix)
                    %do the draw process
                    delta=draw(matrix,ballMatrix,deltaRed,deltaBlack);
                    %(delta)
                    %sum all Zn
                    tracker(a,b,c)=sum(delta(1,:))/deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+delta;
                case 5
                    delta=infectednessAndCentrality(budget,matrix,ballMatrix);
                    %add the black balls according to the control policy
                    ballMatrix=ballMatrix+[zeros(1,n);delta];
                    %(ballMatrix)
                    %do the draw process
                    delta=draw(matrix,ballMatrix,deltaRed,deltaBlack);
                    %(delta)
                    %sum all Zn
                    tracker(a,b,c)=sum(delta(1,:))/deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+delta;
                case 6
                    delta=nodeDegree(budget,matrix);
                    %add the black balls according to the control policy
                    ballMatrix=ballMatrix+[zeros(1,n);delta];
                    %(ballMatrix)
                    %do the draw process
                    delta=draw(matrix,ballMatrix,deltaRed,deltaBlack);
                    %(delta)
                    %sum all Zn
                    tracker(a,b,c)=sum(delta(1,:))/deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+delta;
                case 7
                    delta=ratioOfInfectedness(budget,ballMatrix);
                    %add the black balls according to the control policy
                    ballMatrix=ballMatrix+[zeros(1,n);delta];
                    %(ballMatrix)
                    %do the draw process
                    delta=draw(matrix,ballMatrix,deltaRed,deltaBlack);
                    %(delta)
                    %sum all Zn
                    tracker(a,b,c)=sum(delta(1,:))/deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+delta;
                case 8
                    delta=superUrnRatio(budget,matrix,ballMatrix);
                    %add the black balls according to the control policy
                    ballMatrix=ballMatrix+[zeros(1,n);delta];
                    %(ballMatrix)
                    %do the draw process
                    delta=draw(matrix,ballMatrix,deltaRed,deltaBlack);
                    %(delta)
                    %sum all Zn
                    tracker(a,b,c)=sum(delta(1,:))/deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+delta;
                case 9
                    delta=uniformlyApplyingTheBudget(budget,matrix);
                    %add the black balls according to the control policy
                    ballMatrix=ballMatrix+[zeros(1,n);delta];
                    %(ballMatrix)
                    %do the draw process
                    delta=draw(matrix,ballMatrix,deltaRed,deltaBlack);
                    %(delta)
                    %sum all Zn
                    tracker(a,b,c)=sum(delta(1,:))/deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+delta;
            end
        end
    end
end
                    

