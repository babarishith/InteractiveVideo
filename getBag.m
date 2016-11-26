function b = getBag(I, m)
    bw = rgb2gray(I);
    [im, dir] = imgradient(bw);
    md = double(rgb2gray(m));
    im = im * 0.1;
    n = -50;
    ni = im+md*n;
%     imshow(uint8(ni));
    s = size(im);
    
    %seam carving removal
    si = s(2);
    k = 5;
    cm = costMat(ni);
    while min(ni(:)) < 0
%     for e = 1:100
        [x, i] = min(cm(s(1), 1:si));
        for r = s(1):-1:1
            if i == 1
                [x, c] = min([cm(r, i) cm(r, i+1)]);
                c = c -1;
            elseif i == si
                [x, c] = min([cm(r, i-1) cm(r, i)]);
                c = c - 2;
            else
                [x, c] = min([cm(r, i-1) cm(r, i) cm(r, i+1)]);
                c = c -2;
            end
            p = i+c;
            cm(r, p:si-1) = cm(r, p+1:si);
            ni(r, p:si-1) = ni(r, p+1:si);
            I(r, p:si-1,:) = I(r, p+1:si,:);
            I(r, si, :) = 255;
            cm(r, si) = 0;
            ni(r, si) = 0;
            i = p;
        end
        si = si - 1;
    end
    imshow(uint8(I));
    
    %seam carving expansion
    
    b = 1;
end