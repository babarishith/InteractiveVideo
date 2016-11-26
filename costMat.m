function g = costMat(im)
im = double(im);
s = size(im);

%cost matrix
for i = 2:s(1)
    for j = 1:s(2)
        if j == 1
            l = min(im(i-1,j), im(i-1,j+1));
        elseif j == s(2)
            l = min(im(i-1,j), im(i-1,j-1));
        else
            l = min([im(i-1,j-1), im(i-1,j), im(i-1,j+1)]);
        end
        im(i,j) = im(i,j) + l;
    end
end
g = im;
end