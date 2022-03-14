% returns an array of factorials up to n!
function out = factorialA(n)
out = ones(1,n+1);
for i = 1:n
    out(i+1) = out(i)*i;
end
end