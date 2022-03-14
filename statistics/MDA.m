% Applies multidiscriminatory dimension analysis
% rows = observation
% columns = dimensions
% cells = classes
% this code assumes that every class is the same size
% last updated 9/21/2018

function out = MDA(data,dims)
[R,C] = size(data{1});
L = length(data);
mu = zeros(L,C);
S = {};
Sw = zeros(C,C);
Sb = zeros(C,C);
for l = 1:L
    mu(l,:) = mean(data{l},1);
end
muall = mean(mean(mu));
for l = 1:L
    temp = data{l} - (mu(l,:)'*ones(1,R))';    
    S{l} = temp'*temp/R;
end
Sw = zeros(size(S{1}));
for l = 1:L
    Sw = Sw + S{l};
    Sb = Sb + (mu(l,:)-muall)'*(mu(l,:)-muall);
end
Sb = Sb*L;
[v,e] = eig(inv(Sw)*Sb);
W = v(:,1:dims);
out = {};
for l = 1:L
    out{l} = data{l}*abs(W);
end

end