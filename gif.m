img = imread('penc.jpg');
[o,m,b, oi,oj,r] = main(img);
for ang = 350:-5:315
    [ri,rm] = rot(o,m,oi,oj,ang,r);
    fi = ri+b.*(1-rm);
    figure
    imshow(fi);
end