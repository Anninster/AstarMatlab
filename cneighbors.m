function [neigh] = cneighbors(C,row,col,n)
%CNEIGHBORS Summary of this function goes here
%   Detailed explanation goes here
    x=C(1);
    y=C(2);
    neigh4=[x y-1 ; x-1 y ; x+1 y ; x y+1 ];
    neighd=[x-1 y-1 ; x-1 y+1 ; x+1 y-1 ; x+1 y+1 ];
    neigh8=[neigh4;neighd];
    
    if(n==1)
        neigh=neigh4;
    elseif(n==2)
        neigh=neighd;
    else
        neigh=neigh8;
    end
    r=size(neigh,1);
    rtr=[];
    for i=1:r
        for j=1:2
            if neigh(i,1)<1 || neigh(i,1)>row
                rtr=[rtr,i];
            elseif neigh(i,2)<1 || neigh(i,2)>col
                rtr=[rtr,i];
            end
        end
    end
    neigh(rtr,:)=[];
    


end

