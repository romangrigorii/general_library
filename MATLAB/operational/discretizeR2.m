function out = discretizeR2(sig,L,method)
% discretizes an array. refer to discretizeR for more details.
sig = detrend(sig);
switch method
    case 'eiw'
        minn = min(sig);
        maxx = max(sig);
        descretearray = linspace(minn,maxx,L+1);
        substitutearray = linspace(1/(L*2),1 - (1/(L*2)),L);
        out = zeros(size(sig));
        for l = 1:L
            if l == L
                out = out + (sig>=descretearray(l)).*(sig<=descretearray(l+1))*substitutearray(l);
            else
                out = out + (sig>=descretearray(l)).*(sig<descretearray(l+1))*substitutearray(l);
            end
        end
    case 'fi'
        minn = min(sig);
        maxx = max(sig);
        orderedarray = sort(sig);
        cutoff = round(length(sig)*linspace(0,1,L+1));
        cutoff(1) = 1;
        cutoffamp = orderedarray(cutoff);
        out = zeros(size(sig));
        substitutearray = linspace(0,1,L);
        for l = 1:L
            if l == L
                out = out + (sig>=cutoffamp(l)).*(sig<=cutoffamp(l+1))*substitutearray(l);
            else
                out = out + (sig>=cutoffamp(l)).*(sig<cutoffamp(l+1))*substitutearray(l);
            end
        end
end
end