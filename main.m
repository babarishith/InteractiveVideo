%Input video and initial processing
im = imread('pen.jpg');

%Detect Object and get mask
m = getObj(im);

%seperate object and background
o = im.*m;
b = getBag(im, m);

%detect pivot

%get mouse input and angle

%transform object 

%combine object and background in video