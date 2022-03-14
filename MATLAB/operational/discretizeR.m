function out = discretizeR(data,n,method)
% discretizeR takes a data cell, each entry of which contans class specific
% matrix, rows of which are trials, and columns are the attributes.
% method sets the type of discretization that occurs. 'eiw' corresponds to
% equal interval width, meaning that the data will be seperated in equally 
% size bins. 'fi' will discretize data based on frequency, thus data bin 
% sizes are subject to vary as their bounds vary according to frequency of 
% each element. The number of entries in each bins in this scenario will 
% stay the same. Descretization accurs based on the entries of the entire
% cell.
% last updated on 09/21/2018
D = [];dat = data;
for d = 1:length(dat)
    D = [D;dat{d}];
end
[l,~] = size(D);
maxx = vectomat(max(D),l)';
minn = vectomat(min(D),l)';
D = (D-minn)./(maxx-minn);
st = 1;
for d = 1:length(dat)
    [l,~] = size(dat{d});
    en = st + l - 1;
    dat{d} = D(st:en,:);
    st = st + l;
end
switch method
    case 'eiw' % equal interval width
        Ddiscretized = zeros(size(D));
        for l = 1:n
            if l == n
                Ddiscretized = (D>=(l-1)/n).*(D<=l/n)*(l-.5)/n + Ddiscretized;
            else
                Ddiscretized = (D>=(l-1)/n).*(D<l/n)*(l-.5)/n + Ddiscretized;
            end
        end
        D = Ddiscretized;
        st = 1;
        for d = 1:length(dat)
            [l,~] = size(dat{d});
            en = st + l - 1;
            dat{d} = D(st:en,:);
            st = st + l;
        end
    case 'fi' % frequency intervals
        [l1,l2] = size(D);
        Ddiscretized = zeros(size(D));
        [~,Do] = sort(D);
        S = l1/n;
        for f = 1:l2
            for l = 1:n
                for s = 1:S
                    Ddiscretized(Do((l-1)*S+s,f),f) = (l-.5)/n;
                end
            end
        end
        D = Ddiscretized;
        st = 1;
        for d = 1:length(dat)
            [l,~] = size(dat{d});
            en = st + l - 1;
            dat{d} = D(st:en,:);
            st = st + l;
        end       
end
out = {};
out{1} = dat;
out{2} = D;
end