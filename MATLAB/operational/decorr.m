function out = decorr(data,Nvals,white)
    dat = data; da = {};
    m = cov(data{1}); 
    [eigvec,eigval] = eig(m);
    for d = length(data)
        dat{d} = data{d}*eigvec;
        dat{d} = flip(flip(dat{d}')');
    end
    for d = 1:length(data)
        da{d} = dat{d}(:,1:Nvals);
    end
    if white == 1
        for d = 1:length(data)
            da{d} = da{d}*real((inv(cov(da{d})).^(-.5)));
        end
    end
	out = {}; out{1} = da; out{2} = diagextract(eigval);        
end