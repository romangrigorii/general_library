% a one sided differentiator of the first order
function out = one_sided_1(sig,order)
out = zeros(size(sig));
switch order
    case 1
        out(2:end) = diff(sig);
    case 2
        for i = 3:length(sig)
            out(i) = 3*sig(i) - 4*sig(i-1) + sig(i-2);
        end
        out = out/2;
end