function [o,m,b,ci,cj,r] = main(im1,im2)
%Input video and initial processing
im1 = imread('framepic.png');
im2 = 0;
if im2 == 0
%Detect Object and get mask
    m = getObj(im1);

    %seperate object and background
    o = im1.*m;
    b = getBag(im1, m);

    [ci,cj,r] = pre_crop(o);
else
    [b,mask,m] = getBag2(im1,im2);
    o = im2.*m;
    [ci,cj,r] = pre_crop(o);
%     [ci,cj,r1] = pre_crop(mask);
end
% %get mouse input and angle
ang = 15;
%transform object 
%Rotation
%[ri,rm] = rotate(o,m,ang,ci,cj);
[ri,rm] = rot(o,m,[ci,cj],ang,r);
fi = ri+b.*(1-rm);
or = o+b.*(1-m);
% figure;
%imshow(fi);
%figure;
% imshow(fi);
% imshowpair(im1,fi,'montage');
%detect pivot





%combine object and background in video