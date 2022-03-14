% given paramters of a discrete transfer function, e.g.
%     bn*x(1)+...+b1*x(n)
% T = -------------------
%     an*y(1)+...+a1*y(n)
% the following code takes an input signal sig and passes it through the
% transfer function T. The code assumes that a(1) = 1.

function out =  filteriir(b,a,sig)
la = length(a);
lb = length(b);
out = sig;
%sig(1:max(la,lb)) = 0;
L = length(sig);
for i = max(la,lb):L
    A = 0;
    B = 0;
    for l = 2:la
        A = a(l)*out(i - l + 1) + A;
    end
    for k = 1:lb
        B = b(k)*sig(i - k + 1) + B;
    end
    out(i) = B - A;
end            
end