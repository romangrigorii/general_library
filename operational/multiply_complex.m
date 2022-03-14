function out = multiply_complex(a,b,c,d)
out = (a.*c) - (b.*d) + sqrt(-1)*((a.*d) + (b.*c));
end