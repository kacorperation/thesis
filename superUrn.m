%Creates a cell of all super urns. Row 1= node 1's super urn etc.
function c=superUrn(matrix)
    n=size(matrix,2);
    for i=1:n
        c{i,1}=[findNeighbors(matrix,i) i];
    end
end