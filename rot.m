function [ri,rm]=rot(img,m,c,ang,r)
    s = size(img);
    ri = uint8(zeros(s));
    rm = uint8(zeros(s));
    w = s(1); h = s(2);
    disp(c);
    for x1 = 1:w
        for y1 = 1:h
            [x,y] = twirl(x1,y1,c,ang,r);
            ri(x1,y1,:) = img(x,y,:);
            rm(x1,y1,:) = m(x,y,:);
        end
    end
%     imshow(ri);
end