function results=averageResults(result,timeSteps,amountOfExperiments)
averageData=zeros(size(result,1),timeSteps);
for a=1:size(result,1)
    for b=1:amountOfExperiments
        for c=1:timeSteps
            averageData(a,c)=(averageData(a,c)+result(a,b,c));
        end
    end
end
results=averageData/amountOfExperiments;