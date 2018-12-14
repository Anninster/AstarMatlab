function [ hv ] = h(endpoint,cur)
%H Summary of this function goes here
%   Detailed explanation goes here
    hv=sqrt(((endpoint(1,1)-cur(1,1))^2) + ((endpoint(1,2)-cur(1,2))^2));

end

