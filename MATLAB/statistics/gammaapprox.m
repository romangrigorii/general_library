% approximiate analytic functon of the gamma function
function out = gammaapprox(x)
x = x - 1;
out = sqrt(2*pi*x).*((x./exp(1)).^(x)).*((x.*sinh(1./x)).^(x/2)).*exp(7/324*(1./((x.^3).*(35*x.^2 + 33))));
end