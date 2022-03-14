function out = pwelchr(x,window,overlap)
gap = window - overlap;
L = floor((length(x) - window)/gap);
h = hannr(window);
out = zeros(1,window);
for l = 1:L
    out = out + 4*abs(fft(x((l-1)*gap+1:(l-1)*gap + window).*h))/window/L;
end
end