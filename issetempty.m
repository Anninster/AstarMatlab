function [b] = issetempty(set)
%ISSETEMPTY Summary of this function goes here
%   Detailed explanation goes here
    s=size(set);
    b=1;
    for i=1:s(1)
        for j=1:s(2)
            if(set(i,j)>0)
                b=0;
            end
        end
    end

end

