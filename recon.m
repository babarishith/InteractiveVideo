function y = recon(x)
    n = size(x);
    lev = n(2);
    y = x{lev};
    for i=1:lev-1
        s = size(x{lev-i});
        y1 = imresize(y, [s(1), s(2)]);
        up = x{lev-i};
        s = size(y1);
        y = y1 + up;
    end
    figure;
    imshow(uint8(y));
end