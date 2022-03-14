function out = integR(sig,sr)
out = sig/2;
for i = 2:length(sig) - 1
    out(i) = sig(i) + out(i-1);
end
out(end) = out(end-1) + sig(end)/2;
out = out/sr;
end