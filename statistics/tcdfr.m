% given x returns student's t distriuton value
function out = tcdfr(x,v)
size(gammaapprox((v+1)/2))
size(hypergeometric(.5,(v+1)/2,3/2,-(x.^2)/v,5))
out = 1/2 + x.*gammaapprox((v+1)/2).*hypergeometric(.5,(v+1)/2,3/2,-(x.^2)/v,5)./sqrt(pi*v)./gammaapprox(v/2);
end