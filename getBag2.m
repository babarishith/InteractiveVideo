im1 = imread('tp1.jpg');
im2 = imread('tp2.jpg');

s1 = abs(im1-im2);
s2 = abs(im2-im1);

sb1 = rgb2gray(s1);
sb2 = rgb2gray(s2);

sb1 = im2bw(sb1,0.1);
sb2 = im2bw(sb2,0.1);

s = strel('disk', 10);

sbo1 = imopen(sb1,s);
sbo2 = imopen(sb2,s);

se = strel('disk', 30);
d1 = imdilate(sbo1, se);
d2 = imdilate(sbo2, se);

%figure;
%imshowpair(d1,d2,'montage');

S = s1+s2;
Sb = rgb2gray(S);
Sb = im2bw(Sb,0.1);
s = strel('disk', 8);
Sbo = imopen(Sb,s);
se = strel('disk', 10);
d = imdilate(Sbo, se);
%figure;
%imshow(d);

bg = zeros(size(im1));
for i = 1:3
    b2 = uint8(1-d1).*im2(:,:,i);
    b1 = uint8(1-d2).*im1(:,:,i);
    bg(:,:,i) = max(b2,b1);
end

bg = uint8(bg);

mask = min(d1,d2);
mask = uint8(repmat(mask,[1 1 3]));


