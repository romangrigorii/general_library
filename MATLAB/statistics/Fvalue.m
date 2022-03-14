% data is the values over which the statistic shall be computed
% for type 1: it is assumed that data is a single matrix, for which the
% rows represent trials and columns represent factors
% for type 2: it is assumed that data is a cell, each entry of which
% corresponds to a factor, and each entry eithin the cell corresponding to
% trials
% The code is implemented based upon the readings from "An Introduction to
% Mathematical Statistics and its Applications 3rd Edition" by Richard
% Larsen, Chaper 12.
% last updated 09/21/2018

function out = Fvalue(data,type)

if type==1
    [n,k] = size(data);
    muk = mean(data);
    mu = mean(mean(data));
    Nk = sum(data);
    SSTR = sum(n.*((muk-mu).^2));
    SSE = sum(sum((data - muk).^2));
    F = SSTR*(n*k-k)/(k-1)/(SSE);
    out = [F,1-fcdf(F,k-1,(n-1)*k)];
elseif type == 2
    k = length(data);
    n = zeros(1,k);
    muk = zeros(1,k);
    SSE = 0;
    for k = 1:K
        n(k) = length(data{k});
        muk(k) = mean(data{k});
        mu = sum(data{k});
        SSE = SSE + sum((data{k} - muk(k)).^2);
    end
    mu = mu/sum(n);
    SSTR = sum(n.*((muk - mu).^2));    
    F = SSTR*((mean(n)*k) - k)/(k-1)/SSE;
    out = [F,1-fcdf(F,k-1,(mean(n)-1)*k)];       
else
    fprintf('Please indicate the proper type (1,2)\n');
end
end