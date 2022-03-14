function out=filteriir2(b,a,sig)
[lf,lp] = size(b);
sig(1:lp) = 0;
out = sig;
L = length(sig);
for i = lp+lf:L
    C = 1;
    for ii = 1:lf
        A = 0;
        B = 0;
        for l = 2:lp
            A = a(ii,l)*out(i - l + 1) + A;
        end
        for k = 1:lp
            B = b(ii,k)*sig(i - k + 1) + B;
        end
        C = C*(B - A);
    end
    out(i) = sign(C)*(abs(C)^(1/lf));
end
end