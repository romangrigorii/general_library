% computes pochhammer factorial symbol
function out = pochhammerr(q,n)
out = ones(1,n+1);
for k = 1:n
    out(k+1) = out(k)*(q+k-1);
end
end