%This function rounds up the elements properly to the desired target number
%using largest remainder method
function result=properRounder(targetSum,array)
    n=size(array,2);
    result=zeros(1,n);
    %this measures the difference between floord value and the real value
    differences=zeros(1,n);
    summer=0;
    for i=1:n
        summer=summer+floor(array(i));
    end
    %floor causes rounding errors
    if(summer<targetSum)
        %populate differences
        for i=1:n
            differences(i)=array(i)-floor(array(i));
        end
        for i=1:(targetSum-summer)
            [val, index]=max(differences);
            array(index)=floor(array(index))+1;
            differences(index)=0;
        end
    end
        for i=1:n
            result(i)=floor(array(i));
        end
end