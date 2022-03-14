function out = divide_complex(a,b,c,d)
%% divides a + ib by c + id
out = ((a.*c) + (b.*d) - (sqrt(-1)*a.*d) + (sqrt(-1)*b.*c))./((c.^2)+(d.^2));
end