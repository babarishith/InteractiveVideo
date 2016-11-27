img1 = imread('tpm1.jpg');
img2 = imread('tpm2.jpg');
[o,m,b, oi,oj,r] = main(img1,img2);
for ang = 350:-5:315
    [ri,rm] = rot(o,m,[oi,oj],ang,r);
    fi = ri+b.*(1-rm);
    %figure
    %imshow(fi);
    imwrite(fi,['vid1/' num2str((355-ang)/5) '.jpg']);
    
end
imwrite(fi,'f.jpg');