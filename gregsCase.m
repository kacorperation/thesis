%adjecency matrix
matrix=[0 0 1 0 0 0;0 0 1 0 0 0;1 1 0 1 0 0;0 0 1 0 1 1;0 0 0 1 0 1;0 0 0 1 1 0];
%initial conditions
initial=[4 4 4 4 4 4;0 0 0 0 0 0];
budget=2;
n=size(matrix,2);
deltaRed=4;
deltaBlack=4;
%end of variable decleration


initialInfectedness=0;
for i=1:n
    initialInfectedness=initialInfectedness+initial(1,i)/(initial(1,i)+initial(2,i));
end
initialInfectedness=initialInfectedness/n;
%control procedure
%current=initial+...
%current=draw(matrix,current,deltaRed,deltaBlack);
%currentInfectedness=0;
%for i=1:n
    %currentInfectedness=currentInfectedness+current(1,i)/(current(1,i)+current(2,i));
%end
%currentInfectedness=currentInfectednessInfectedness/n;