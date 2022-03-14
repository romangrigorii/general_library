function out = sqwave(t,f,n)
out = zeros(size(t));
for i = 0:n
    out = out + (sin(((2*i)+1)*2*pi*f*t)/((2*i)+1));
end
end