% hypergeomtric gamma function
function out = hypergeometric(a,b,c,z,o)
out = zeros(1,length(z));
alist = pochhammerr(a,o);
blist = pochhammerr(b,o);
clist = pochhammerr(c,o);
f = factoriallist(o);
for i = 1:length(z)
    zlist = (z(i)*ones(1,o+1)).*(0:o);
    out(i) = sum(alist(:).*blist(:).*zlist(:)./f(:)./clist(:));
end
end