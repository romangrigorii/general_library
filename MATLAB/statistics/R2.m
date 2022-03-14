% computes R squared of given data: x, y
function out = R2(x,y,yfit)
L = length(y);
SStot = 0;
SSres = 0;
for i = 1:L
    for ii = 1:length(x{i})
        SStot = SStot + (x{i}(ii) - y{i})^2;
        SSres = SSref + (x{i}(ii) - yfit{i})^2;
    end
end
out = 1 - SSres/SStot;
end