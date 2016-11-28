img1 = imread('tpm1.jpg');
img2 = imread('tpm2.jpg');
[o,m,b, oi,oj,r] = main(img1,img2);
i = 1;
for ang = 355:-5:270
    [ri,rm] = rot(o,m,[oi,oj],ang,r);
    fi = ri+b.*(1-rm);
    %figure
    %imshow(fi);
    imwrite(fi,['gif2/' num2str(i) '.jpg']);
    i = i + 1;
end

for ang = 265:5:350
    [ri,rm] = rot(o,m,[oi,oj],ang,r);
    fi = ri+b.*(1-rm);
    %figure
    %imshow(fi);
    imwrite(fi,['gif2/' num2str(i) '.jpg']);
    i = i + 1;
end