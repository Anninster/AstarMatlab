clc;
clear all;
close all;
row=100;
col=100;
im=rand(row,col,3);
im=im2uint8(im);
im(:,:,:)=255;
for i=1:row
    for j=1:col
        x=rand();
        if(x<=0.2)
            im(i,j,:)=0;
        end
    end
end
% st=rand(1,2);
% st=ceil(st.*[row col]);
% ed=rand(1,2);
% ed=ceil(ed.*[row col]);
st=[1 1];
ed=[row col];
im(st(1),st(2),:)=0;
im(st(1),st(2),2)=255;
im(ed(1),ed(2),:)=0;
im(ed(1),ed(2),1)=255;
%imshow(im)
imwrite(im,'maze.png','png');