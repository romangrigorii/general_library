% computer Pearson correlation coefficient between two 1D arrays of same
% length
function out = corr(data1,data2)
data1 = data1(:);
data2 = data2(:);
out = sum((data1 - mean(data1)).*(data2 - mean(data2)))/sqrt(sum((data1-mean(data1)).^2))/sqrt(sum((data2-mean(data2)).^2));
end