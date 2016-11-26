function b = getBag(I, m)
    bw = rgb2gray(I);
    [im, dir] = imgradient(bw);
    md = double(rgb2gray(m));
    im = im * 0.08;
    n = -50;
    ni = im+md*n;
%     imshow(uint8(ni));
    s = size(im);
    figure;
    subplot(1,2,1)
    imshow(uint8(I));
    
    %seam carving removal
    si = s(2);
    k = 5;
    cm = costMat(ni,0);
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
    
    %seam carving expansion
    cm = costMat(ni,si);
    re = zeros(s);
    ma = max(cm(s(1), 1:si));
    d=200;
    ol = si;
    
    for e = 1:s(2)-ol
        [x, i] = min(cm(s(1), 1:si));
        y =i;
        for r = s(1):-1:1
            if i == 1
                [x, c] = min([cm(r, i)+re(r,i)*d cm(r, i+1)+re(r,i)*d]);
                c = c -1;
            elseif i == si
                [x, c] = min([cm(r, i-1)+re(r,i-1)*d cm(r, i)+re(r,i)*d]);
                c = c - 2;
            else
                [x, c] = min([cm(r, i-1)+re(r,i-1)*d cm(r, i)+re(r,i)*d cm(r, i+1)+re(r,i+1)*d]);
                c = c -2;
            end
            p = i+c;
            re(r, p) = re(r, p) + 1;
            re(r, p+1) = re(r,p+1) + 1;
            cm(r,p) = ma;
            cm(r, p+1:si+1) = cm(r, p:si);
            ni(r, p+1:si+1) = ni(r, p:si);
            I(r, p+1:si+1,:) = I(r, p:si,:);
            i = p;
        end
        si = si+1;
        cm(s(1), y) = ma;
    end
    subplot(1,2,2)
    imshow(uint8(I));
    
    b = I;
end