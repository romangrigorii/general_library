% a one sided differentiator of second order
function out = one_sided_2(sig,order)
out = zeros(size(sig));
switch order
    case 1
        for i = 3:length(sig)
            out(i) = sig(i) - 2*sig(i-1) + sig(i-2);
        end
    case 2
        for i = 4:length(sig)
            out(i) = 2*sig(i) - 5*sig(i-1) + 4*sig(i-2) - sig(i-3);
        end        
end