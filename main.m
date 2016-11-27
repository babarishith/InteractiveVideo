function [o,m,b,ci,cj,r] = main(im)
%Input video and initial processing
% im = imread('penc.jpg');

%Detect Object and get mask
m = getObj(im);

%seperate object and background
o = im.*m;
b = getBag(im, m);

[ci,cj,r] = pre_crop(o);
%get mouse input and angle
% ang = 15;
%transform object 
%Rotation
%[ri,rm] = rotate(o,m,ang,ci,cj);
% [ri,rm] = rot(o,m,ci,cj,ang,r);
% fi = ri+b.*(1-rm);
% or = o+b.*(1-m);
% figure;
% imshow(or);
% figure;
% imshow(fi);
%imshowpair(or,fi,'montage');
%detect pivot





%combine object and background in video