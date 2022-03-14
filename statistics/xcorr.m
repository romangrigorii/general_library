% computs cross-correlation between two signals
function out = xcorr(sig1,sig2)
sig1 = sig1(:);
sig2 = sig2(:);
out = zeros(size(sig1));
for i = 1:length(out)
    out(i) = corr(sig1,[sig2(i+1:end),sig2(1:i)]);
end
end