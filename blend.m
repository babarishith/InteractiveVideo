function y = blend(o, b, m)
lev = 5;
[a, sp] = two(o, lev);
[a, tp] = two(b, lev);
[mp, a] = two(m, lev);
new = cell([1 lev+1]);
for n = 1:lev+1
%     mp{n} = double(repmat(mp{n},[1 1 3]));
    new{n} = double(sp{n}).*double(mp{n})+double(tp{n}).*(1-double(mp{n}));
    %new{n} = imfilter(sp{n}, mp{n}) + tp{n};
end
twob(new);