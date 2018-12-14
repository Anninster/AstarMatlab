function [ wnv ] = wn(d,N)
%WN Summary of this function goes here
%   Detailed explanation goes here
    if d<=N
        wnv=1-(d/N);
    else
        wnv=0;
    end

end

