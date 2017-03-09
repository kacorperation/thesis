%This function outputs the array described below that stores the
%effectiveness of infection prevention methods for same initial conditionsfunction
function [tracker,deltaLossMatrix]=doExperiments(n,amountOfExperiments,timeSteps,initial,matrix,budget,deltaRed,deltaBlack)
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
10-degreeCentralitySuperUrn
More will be added later
%}
amountOfMethods=10; %change this as more experiments are added
%tracker will store the average Z of a system for every experiment and
%every time step of it (ie tracker(a)(b)(c) will record method a's
%experiment number b's average Z value at time step c
tracker=zeros(amountOfMethods,amountOfExperiments,timeSteps);
%keep track of how much budget was lost each step
deltaLossMatrix=zeros(amountOfMethods,amountOfExperiments,timeSteps);
for a=1:amountOfMethods
    for b=1:amountOfExperiments
        %reset the ballMatrix whenever you are doing a new experiment
        ballMatrix=initial;
        for c=1:timeSteps
            deltaLoss=0;
            switch a
                case 1
                    %pre-decide the budget allocation
                    delta1=cureMostInfectedNode(budget,ballMatrix,n);
                    %do the draw process
                    delta2=draw(matrix,ballMatrix);
                    %sum all Zn
                    tracker(a,b,c)=sum(delta2(1,:));
                    %find how many black balls to add to the system
                    for i=1:n
                        if (delta2(2,i)==0)
                            deltaLoss=deltaLoss+delta1(i);
                            delta1(i)=0;
                        end
                    end
                    %find how many red balls to add to the system
                    
                    delta2=delta2(1,:);
                    delta2=delta2*deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+[delta2;delta1];
                case 2
                    delta1=degreeAndInfectedness(budget,matrix,ballMatrix,n);
                    %do the draw process
                    delta2=draw(matrix,ballMatrix);
                    %sum all Zn
                    tracker(a,b,c)=sum(delta2(1,:));
                    %find how many black balls to add to the system
                    for i=1:n
                        if (delta2(2,i)==0)
                            deltaLoss=deltaLoss+delta1(i);
                            delta1(i)=0;
                        end
                    end
                    %find how many red balls to add to the system
                    
                    delta2=delta2(1,:);
                    delta2=delta2*deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+[delta2;delta1];
                case 3
                    delta1=degreeAndSuperUrnRatio(budget,matrix,ballMatrix,n);
                    %do the draw process
                    delta2=draw(matrix,ballMatrix);
                    %sum all Zn
                    tracker(a,b,c)=sum(delta2(1,:));
                    %find how many black balls to add to the system
                    for i=1:n
                        if (delta2(2,i)==0)
                            deltaLoss=deltaLoss+delta1(i);
                            delta1(i)=0;
                        end
                    end
                    %find how many red balls to add to the system
                    
                    delta2=delta2(1,:);
                    delta2=delta2*deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+[delta2;delta1];
                case 4
                    delta1=eigenCentralityAndSuperUrnRatio(budget,matrix,ballMatrix,n);
                    %do the draw process
                    delta2=draw(matrix,ballMatrix);
                    %sum all Zn
                    tracker(a,b,c)=sum(delta2(1,:));
                    %find how many black balls to add to the system
                    for i=1:n
                        if (delta2(2,i)==0)
                            deltaLoss=deltaLoss+delta1(i);
                            delta1(i)=0;
                        end
                    end
                    %find how many red balls to add to the system
                    
                    delta2=delta2(1,:);
                    delta2=delta2*deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+[delta2;delta1];
                case 5
                    delta1=infectednessAndCentrality(budget,matrix,ballMatrix,n);
                    %do the draw process
                    delta2=draw(matrix,ballMatrix);
                    %sum all Zn
                    tracker(a,b,c)=sum(delta2(1,:));
                    %find how many black balls to add to the system
                    for i=1:n
                        if (delta2(2,i)==0)
                            deltaLoss=deltaLoss+delta1(i);
                            delta1(i)=0;
                        end
                    end
                    %find how many red balls to add to the system
                    
                    delta2=delta2(1,:);
                    delta2=delta2*deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+[delta2;delta1];
                case 6
                    delta1=nodeDegree(budget,matrix,n);
                    %do the draw process
                    delta2=draw(matrix,ballMatrix);
                    %sum all Zn
                    tracker(a,b,c)=sum(delta2(1,:));
                    %find how many black balls to add to the system
                    for i=1:n
                        if (delta2(2,i)==0)
                            deltaLoss=deltaLoss+delta1(i);
                            delta1(i)=0;
                        end
                    end
                    %find how many red balls to add to the system
                    
                    delta2=delta2(1,:);
                    delta2=delta2*deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+[delta2;delta1];
                case 7
                    delta1=ratioOfInfectedness(budget,ballMatrix,n);
                    %do the draw process
                    delta2=draw(matrix,ballMatrix);
                    %sum all Zn
                    tracker(a,b,c)=sum(delta2(1,:));
                    %find how many black balls to add to the system
                    for i=1:n
                        if (delta2(2,i)==0)
                            deltaLoss=deltaLoss+delta1(i);
                            delta1(i)=0;
                        end
                    end
                    %find how many red balls to add to the system
                    
                    delta2=delta2(1,:);
                    delta2=delta2*deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+[delta2;delta1];
                case 8
                    delta1=superUrnRatio(budget,matrix,ballMatrix,n);
                    %do the draw process
                    delta2=draw(matrix,ballMatrix);
                    %sum all Zn
                    tracker(a,b,c)=sum(delta2(1,:));
                    %find how many black balls to add to the system
                    for i=1:n
                        if (delta2(2,i)==0)
                            deltaLoss=deltaLoss+delta1(i);
                            delta1(i)=0;
                        end
                    end
                    %find how many red balls to add to the system
                    
                    delta2=delta2(1,:);
                    delta2=delta2*deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+[delta2;delta1];
                case 9
                    delta1=uniformlyApplyingTheBudget(budget,matrix,n);
                    %do the draw process
                    delta2=draw(matrix,ballMatrix);
                    %sum all Zn
                    tracker(a,b,c)=sum(delta2(1,:));
                    %find how many black balls to add to the system
                    for i=1:n
                        if (delta2(2,i)==0)
                            deltaLoss=deltaLoss+delta1(i);
                            delta1(i)=0;
                        end
                    end
                    %find how many red balls to add to the system
                    
                    delta2=delta2(1,:);
                    delta2=delta2*deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+[delta2;delta1];
                case 10
                    delta1=degreeCentralitySuperUrn(budget,matrix,ballMatrix,n);
                    %do the draw process
                    delta2=draw(matrix,ballMatrix);
                    %sum all Zn
                    tracker(a,b,c)=sum(delta2(1,:));
                    %find how many black balls to add to the system
                    for i=1:n
                        if (delta2(2,i)==0)
                            deltaLoss=deltaLoss+delta1(i);
                            delta1(i)=0;
                        end
                    end
                    %find how many red balls to add to the system
                    
                    delta2=delta2(1,:);
                    delta2=delta2*deltaRed;
                    %update the ball matrix
                    ballMatrix=ballMatrix+[delta2;delta1];
            end
            deltaLossMatrix(a,b,c)=deltaLoss;
        end
    end
end
                    

