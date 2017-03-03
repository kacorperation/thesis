%find the neighbors of an urn. neighbors is an array that will stor the
%neighboring urns (ie neighbors=[1 10 56...]
function neighbors=findNeighbors(matrix,i)
    n=size(matrix,2);
    neighbors=zeros(1,sum(matrix(i,:)));
    %k is the index of neighbors
    k=1;
    for j=1:n
        if matrix(i,j)==1
            neighbors(k)=j;
            k=k+1;
        end
    end
end
