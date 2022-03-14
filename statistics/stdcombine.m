% collects a series of means (m) from some pools of data, and the
% corresponding standard deviation (s) and the number of entries in each
% pool (n) and finds the combined first and second order statistics
% into a single set of values. 
% last updated 09/21/2018
function A = stdcombine(m,s,n)
if (length(s)==length(m)) && (length(n) == length(m))
    N = sum(n);
    M = sum(n.*m)/N;
    S = sqrt(sum((n.*(s.^2 + (m - M).^2)))/N);
else
    M = 0;
    S = 0;
    N = 0;
end
A = [M S N];
end