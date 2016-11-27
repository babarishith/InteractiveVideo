%Image and levels as input
function [gp, lp] = pyrd(imgp, lev)
% imgp = input('Enter path to image: ', 's');
% lev = input('Enter the number of levels: ');
% img = double(imread(imgp));
img = double(imgp);
% if islogical(img)
%     img = mat2gray(img);
% end
s = size(img);
if size(s) < 3
    img = logical(img);
    img = repmat(img, [1 1 3]);
end
gp = cell([1 lev+1]);
lp = cell([1 lev+1]);
%x={};
gp{1} = img;

% figure;
% subplot(2, lev+1, 1);
% imshow(uint8(img));
y = img;
%for that many levels
for n = 1:lev
    
    %decrease the size
    y1 = impyramid(y, 'reduce');
    gp{n+1} = y1;
    
%     figure and subplot
%     subplot(2,lev+1,n+1);
%     imshow(uint8(y1));
    
    %expand the same and subtract
    s = size(y);
%     l = lpyrd(y, y1);
    sc = imresize(y1, [s(1), s(2)]);
    l = y(1:s(1), 1:s(2), :) - sc;
    lp{n} = l;
    
%     figure and subplot
%     subplot(2,lev+1,lev+n+1);
%     imshow(uint8(l));
    
    y=y1;
    
end
lp{lev+1} = y1;
% subplot(2,lev+1,lev+1+n+1);
% imshow(uint8(y1));
end