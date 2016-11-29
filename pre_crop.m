function [cx,cy,r] = pre_crop(im)
    flag = 0;
    mini = 0;
    minj = 0;
    maxi = size(im,2);
    maxj = size(im,1);
    for i = 1:size(im,2)
        if (sum(im(:,i)) ~= 0 ) & (flag == 0)
            mini = i;
            flag = 1;
        end
        if (sum(im(:,i)) == 0) & (flag == 1)
            maxi = i;
            break;
        end
    end
    flag = 0;
    for i = 1:size(im,1)
        if (sum(im(i,:)) ~= 0 ) & (flag == 0)
            minj = i;
            flag = 1;
        end
        if (sum(im(i,:)) == 0) & (flag == 1)
            maxj = i;
            break;
        end
    end
    R = [mini minj maxi-mini+1 maxj-minj+1];
    cro = imcrop(im,R);
    cy = uint16((mini+maxi)/2);
    cx = uint16((minj+maxj)/2);
    l = uint8((maxi-mini)/2)
    b = uint8((maxj-minj)/2)
    r = sqrt(double((l*l)+(b*b)));
    %imshow(cro);
end