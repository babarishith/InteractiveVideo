function [ri,rm] = rotate(im ,m, A,ci,cj)
CJ = uint16(size(im,1)/2);
CI = uint16(size(im,2)/2);
J = imtranslate(im,[CI-ci CJ-ci],'OutputView','full');
imshowpair(J,im,'montage');
ri = imrotate(im,A,'bilinear','crop');
rm = imrotate(m,A,'bilinear','crop');
%imshow(ri);
end