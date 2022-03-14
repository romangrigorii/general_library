function out = MarkovR(sig,n,tofill)
    sig = (n-1)*discretizeS(sig,n,'eiw');
    vals = 0:n-1;
    P = zeros(n,n);
    for g = 1:n
        for h = 1:n
            P(g,h) = sum((sig==vals(g)).*([sig(2:end),sig(1)]==vals(h)));
        end
    end
    for g = (length(sig)+1):tofill
        r = round((n-1)*rand(1))+1;
        while P(sig(g-1)+1,r)<=rand(1)
            r = round((n-1)*rand(1))+1;
        end
        sig(g) = r-1;
        g
    end
    out = {};
    out{1} = P;
    out{2} = sig;
end