function m = getObj(im)
%     im = imread('penc.jpg');
    f = 18;
    I = im2bw(im);
    e = edge(I);
    s = strel('disk', f);
    d = 1-imopen(I, s);
    se = strel('disk', f);
    d = imdilate(d, se);
    nb = imclearborder(d, 4);
    m = uint8(repmat(nb, [1 1 3]));
    % I1 = rgb2gray(im);
    %imshow(im.*m);
end