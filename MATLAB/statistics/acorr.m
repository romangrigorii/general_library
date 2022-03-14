% computes autocorrelation of a given 1D signal
function out = acorr(data)
out = data(:);
for i = 1:length(out)
    out(i) = corr(data,[data(i:end),data(1:i-1)]);
end
end