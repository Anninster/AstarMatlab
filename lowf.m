function [c] = lowf(openset,grid,n)
%LOWF Summary of this function goes here
%   Detailed explanation goes here
c(1,1)=n;
c(1,2)=n;
cf=n;
s=size(openset);
for i=1:s(1)
    for j=1:s(2)
        if(openset(i,j))
            if(grid(i,j).f<=cf)
                cf=grid(i,j).f;
                c(1,1)=i;
                c(1,2)=j;
            end
        end
    end
end

end

