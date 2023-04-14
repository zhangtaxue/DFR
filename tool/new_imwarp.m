function I2 = new_imwarp(I,H,bb,w,h)
%IMWARP  Image warp 
% Apply the projective transformation specified by H to the image I 
% The bounding box is specified with [minx; miny; maxx; maxy];

[x,y] = meshgrid(bb(1):bb(3),bb(2):bb(4));
x = x - w/2;
y = y - h/2;
pp = htx(inv(H),[x(:),y(:)]');
xi=reshape(pp(1,:),size(x,1),[]);
yi=reshape(pp(2,:),size(y,1),[]);
xi = xi + w/2;
yi = yi + h/2;
I2=interp2(1:size(I,2),1:size(I,1),double(I),xi,yi,'linear',255);

cast(I2,class(I)); % cast I2 to whatever was I

