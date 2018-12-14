mapcreator
clc;
clear all;
close all;
im=imread('maze.png');
in=im;
s=size(im);
row=s(1);
col=s(2);
ns=1;
eb=5;
%make openset and closedset a rowxcol boolean matrix push set it to 1 and
%remove sets it to 0
d=1;
grid(row,col)=pixel(row,col);
for i=1:row
    for j=1:col
        grid(i,j)=pixel(i,j);
    end
end
im=imread('maze.png');
s=size(im);
for i=1:s(1)
    for j=1:s(2)
        if(im(i,j,1)==0 && im(i,j,2)==255 && im(i,j,3)==0)
            start=[i j];
            im(i,j,1)=255;
            im(i,j,2)=255;
            im(i,j,3)=255;
        end
        if(im(i,j,1)==255 && im(i,j,2)==0 && im(i,j,3)==0)
            endp=[i j];
            im(i,j,1)=255;
            im(i,j,2)=255;
            im(i,j,3)=255;
        end
    end
end
gimg=rgb2gray(im);
for i=1:s(1)
    for j=1:s(2)
        if(gimg(i,j)<=50)
            gimg(i,j)=0;
        else
            gimg(i,j)=255;
        end
        if(gimg(i,j)==0)
            grid(i,j).w=1;
        end
    end
end
f=figure('Position',[10 90 900 900]);
N=h(endp,start);
openset=zeros(row,col);
closedset=zeros(row,col);
path=zeros(row,col);
re=0;
openset=push(openset,start);
while ~issetempty(openset)
    current=lowf(openset,grid,1000000);
    x=current(1,1);
    y=current(1,2);
    if ((current(1,1)==endp(1,1))&&(current(1,2)==endp(1,2)))
        re=1;
        break;
    end
    
    openset=remove(openset,current);
    closedset=push(closedset,current);
    
    neigh=cneighbors(current,row,col,ns);
    sn=size(neigh,1);
    for i=1:sn
        xn=neigh(i,1);
        yn=neigh(i,2);
        if ~(grid(xn,yn).w)
            gs=grid(xn,yn).g;
            if inset(closedset,neigh(i,:))
                continue;
            end

            tgscore=grid(x,y).g+1;

            if ~inset(openset,neigh(i,:))
                openset=push(openset,neigh(i,:));
            elseif (tgscore>=gs)
                continue;
            end

            grid(xn,yn).previous=current;
            grid(xn,yn).g=tgscore;
            grid(xn,yn).f=tgscore + (1+(wn(d,N)*eb)) * h(endp,[xn,yn]);
            %grid(xn,yn).f=tgscore + h(endp,[xn,yn]);
        end
    end
    obj=grid(current(1),current(2));
    path=push(path,current);    
    pr=obj.previous;
    s=size(pr);
    while s>0
        path=push(path,pr);
        obj=grid(pr(1,1),pr(1,2));
        pr=obj.previous;
        s=size(pr);
    end
    for i=1:row
        for j=1:col
            if(closedset(i,j)==1)
                im(i,j,:)=0;
                im(i,j,1)=255;
                im(i,j,2)=255;
            end
            if(openset(i,j)==1)
                im(i,j,:)=0;
                im(i,j,1)=255;
                im(i,j,3)=255;
            end
            if(path(i,j))
                im(i,j,:)=0;
                im(i,j,3)=255;
            end
        end
    end
    im(start(1),start(2),:)=0;
    im(start(1),start(2),2)=255;
    im(endp(1),endp(2),:)=0;
    im(endp(1),endp(2),1)=255;
    imshow(im,'InitialMagnification','fit')
    pause(0.5);
    path=zeros(row,col);
    d=d+1;
end
obj=grid(current(1),current(2));
path=push(path,current);
pr=obj.previous;
s=size(pr);
    while s>0
        path=push(path,pr);
        obj=grid(pr(1,1),pr(1,2));
        pr=obj.previous;
        s=size(pr);
    end
if re
    for i=1:row
        for j=1:col
            if(closedset(i,j)==1)
                im(i,j,:)=0;
                im(i,j,1)=255;
                im(i,j,2)=255;
            end
            if(openset(i,j)==1)
                im(i,j,:)=0;
                im(i,j,1)=255;
                im(i,j,3)=255;
            end
            if(path(i,j))
                im(i,j,:)=0;
                im(i,j,3)=255;
            end
        end
    end
    im(start(1),start(2),:)=0;
    im(start(1),start(2),2)=255;
    im(endp(1),endp(2),:)=0;
    im(endp(1),endp(2),1)=255;
    
else
    'did not find a solution'
end
figure();
subplot(1,2,1);
imshow(in);
subplot(1,2,2);
imshow(im);