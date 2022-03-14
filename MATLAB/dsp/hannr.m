function out = hannr(L)
    t = linspace(0,1,L);
    out = (-cos(2*pi*t) + 1)/2;
end