function results=averageResultsBeta(experiment)
%{
Results is a 2d matrix of form results[a][b] where
a=curing strategy type a
b=average infectedness of the whole system at time step b
%}

strategyType=size(experiment,1);
timeStep=size(experiment,2);
amountOfExperiments=size(experiment,3);
n=size(experiment,4);
results=zeros(strategyType,timeStep);
for i=1:strategyType
    for j=1:timeStep
        sum=0;
        for k=1:amountOfExperiments
            for l=1:n
                sum=sum+experiment(i,j,k,l);
            end
        end
        results(i,j)=sum/n/amountOfExperiments;
    end
end
