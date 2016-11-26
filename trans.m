function [x1, y1] = trans(x, y,ang,rmax)
    dx = double(x - 277);
    dy = double(y - 621);
    r = sqrt(dx^2 + dy^2);
    b = ang*pi/180;
    if r <= rmax 
        x1 = uint16(277 + r*cos(b));
        y1 = uint16(621 + r*sin(b));
    else
        x1 = x; y1 =y;
    end
end