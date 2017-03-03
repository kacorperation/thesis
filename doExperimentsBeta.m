%This function outputs the array described below that stores the
%effectiveness of infection prevention methods for same initial conditionsfunction
function tracker=doExperimentsBeta(n,amountOfExperiments,timeSteps,initial,matrix,budget,deltaRed,deltaBlack)
%{
Create an array tracker[a][b][c][d] with the following dimensions:
a=methodOfSolution
b=trial
c=time step
d=infectedness of node i

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
tracker=zeros(amountOfMethods,amountOfExperiments,timeSteps,n);
%fill in the zeroth condition (initial state before controls kick in)
infection=zeros(1,n);
for i=1:n
    infection(i)=initial(1,i)/(initial(1,i)+initial(2,i));
end
for i=1:amountOfMethods
    for j=1:amountOfExperiments
        %ensure we start each experiment with the initial conditions
        current=initial;
        for k=1:n
            tracker(i,j,1,k)=infection(k);
        end
    end
end
for i=1:amountOfMethods
    for j=1:amountOfExperiments
        for k=2:timeSteps
            %swwitch checks whch curing method is being used and applies it
            switch i
                case 1
                    %apply the curing method
                    current=current+[zeros(1,n);cureMostInfectedNode(budget,current)];
                    %do the draw process
                    current=current+draw(matrix,current,deltaRed,deltaBlack);
                    %calculate and record the infectedness for that time
                    %step
                    infection(i)=current(1,i)/(current(1,i)+current(2,i));
                    for l=1:n
                        tracker(i,j,k,l)=infection(l);
                    end
                    %do the other switch cases...
                case 2
                    %apply the curing method
                    current=current+[zeros(1,n);degreeAndInfectedness(budget,matrix,current)];
                    %do the draw process
                    current=current+draw(matrix,current,deltaRed,deltaBlack);
                    %calculate and record the infectedness for that time
                    %step
                    infection(i)=current(1,i)/(current(1,i)+current(2,i));
                    for l=1:n
                        tracker(i,j,k,l)=infection(l);
                    end
                case 3
                    %apply the curing method
                    current=current+[zeros(1,n);degreeAndSuperUrnRatio(budget,matrix,current)];
                    %do the draw process
                    current=current+draw(matrix,current,deltaRed,deltaBlack);
                    %calculate and record the infectedness for that time
                    %step
                    infection(i)=current(1,i)/(current(1,i)+current(2,i));
                    for l=1:n
                        tracker(i,j,k,l)=infection(l);
                    end
                case 4
                    %apply the curing method
                    current=current+[zeros(1,n);eigenCentralityAndSuperUrnRatio(budget,matrix,current)];
                    %do the draw process
                    current=current+draw(matrix,current,deltaRed,deltaBlack);
                    %calculate and record the infectedness for that time
                    %step
                    infection(i)=current(1,i)/(current(1,i)+current(2,i));
                    for l=1:n
                        tracker(i,j,k,l)=infection(l);
                    end
                case 5
                    %apply the curing method
                    current=current+[zeros(1,n);infectednessAndCentrality(budget,matrix,current)];
                    %do the draw process
                    current=current+draw(matrix,current,deltaRed,deltaBlack);
                    %calculate and record the infectedness for that time
                    %step
                    infection(i)=current(1,i)/(current(1,i)+current(2,i));
                    for l=1:n
                        tracker(i,j,k,l)=infection(l);
                    end
                case 6
                    %apply the curing method
                    current=current+[zeros(1,n);nodeDegree(budget,matrix)];
                    %do the draw process
                    current=current+draw(matrix,current,deltaRed,deltaBlack);
                    %calculate and record the infectedness for that time
                    %step
                    infection(i)=current(1,i)/(current(1,i)+current(2,i));
                    for l=1:n
                        tracker(i,j,k,l)=infection(l);
                    end
                case 7
                    %apply the curing method
                    current=current+[zeros(1,n);ratioOfInfectedness(budget,current)];
                    %do the draw process
                    current=current+draw(matrix,current,deltaRed,deltaBlack);
                    %calculate and record the infectedness for that time
                    %step
                    infection(i)=current(1,i)/(current(1,i)+current(2,i));
                    for l=1:n
                        tracker(i,j,k,l)=infection(l);
                    end
                case 8
                    %apply the curing method
                    current=current+[zeros(1,n);superUrnRatio(budget,matrix,current)];
                    %do the draw process
                    current=current+draw(matrix,current,deltaRed,deltaBlack);
                    %calculate and record the infectedness for that time
                    %step
                    infection(i)=current(1,i)/(current(1,i)+current(2,i));
                    for l=1:n
                        tracker(i,j,k,l)=infection(l);
                    end
                case 9
                    %apply the curing method
                    current=current+[zeros(1,n);uniformlyApplyingTheBudget(budget,matrix)];
                    %do the draw process
                    current=current+draw(matrix,current,deltaRed,deltaBlack);
                    %calculate and record the infectedness for that time
                    %step
                    infection(i)=current(1,i)/(current(1,i)+current(2,i));
                    for l=1:n
                        tracker(i,j,k,l)=infection(l);
                    end
            end
        end
    end
end
