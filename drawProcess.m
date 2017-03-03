function [balls,ratios]=drawProcess(A,initial,time,delta) %variance for ratio? 
    n=size(A,1);
    balls=transpose(initial); %Row i shows black and red balls of node i, in that order
    superUrn=zeros(n,2); %Row i is the number of red and black balls in node i's super urn
    ballDrawn=zeros(n,1); %matrix that shows which ball was drawn from ith super urn
    t=0;%time index
    ratios=zeros(time+1,n);%rows are time steps, cols are a node's red/black. First time step is initial condition
    for j=1:n %populate the first row of ratios
        if (initial(1,j)~=0) && (initial(2,j)~=0)
            ratios(1,j)=initial(1,j)/initial(2,j);
        elseif initial(1,j)==0
            ratios(1,j)=0.1/initial(2,j);
        else
            ratios(1,j)=initial(1,j)/0.1;
        end
    end
    while t<time
       for rows=1:n
           for cols=1:n
               if A(rows,cols)==1 %node rows is connected to node cols
                   superUrn(rows,1)=superUrn(rows,1)+balls(cols,1);
                   superUrn(rows,2)=superUrn(rows,2)+balls(cols,2);
               end
           end
       end
       for rows=1:n
           draw=randi([0 superUrn(rows,1)+superUrn(rows,2)],1,1);
           if draw<=superUrn(rows,1)
               ballDrawn(rows,1)=1;
           end
       end
       for rows=1:n
           if ballDrawn(rows,1)==1
               balls(rows,1)=balls(rows,1)+delta;
           else
               balls(rows,2)=balls(rows,2)+delta;
           end
       end
       superUrn=balls;
       ballDrawn=zeros(n,1);
       t=t+1;
       for j=1:n %populate the t+1th row of ratios
           balls2=transpose(balls);
            if (balls2(1,j)~=0) && (balls2(2,j)~=0)
                ratios(t+1,j)=balls2(1,j)/balls2(2,j);
            elseif balls2(1,j)==0
                ratios(t+1,j)=0.1/balls2(2,j);
            else
                ratios(t+1,j)=balls2(1,j)/0.1;
            end
        end
    end
           
end