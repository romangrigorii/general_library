% the function returns p-value associated with N data points that show
% coefficient of determination of R2 
function p = pR2(R2,N)
p = 2*(1-tcdfr(sqrt(R2./(1-R2)*(N-2)),N-2));
end