% mat - a cell with each cell entry containing a matrix the rows of which
% correspond to different trials and the columns to the features.
% tl - an array of the same length as mat, containing the trial sizes of
% each instance of a the class
% fl - feature space length
% k - number of features left over after applying MDS
function out = mdaRoman(data,tl,fl,k)
    SW = zeros(fl,fl);
    M = [];
    for c = 1:length(data)
        mi = mean(data{c});
        M = [M;mi];
        SM = zeros(fl,fl);
        for i = 1:tl(c)
            S = data{c}(i,:);
            SS = (S-mi)'*(S-mi);
            SM = SS + SM;
        end
        SW = SW + SM;
    end
    m = mean(M);
    SB = zeros(fl,fl);
    for c = 1:length(data)
        SB = SB + tl(c)*(M(c,:)-m)'*(M(c,:)-m);
    end
    det(SW)
    [V,D] = eig(inv(SW)*SB);
    eigval = abs(diagextract(real(D)));
    [~,I] = sort(eigval);
    I = flip(I);
    W = [];
    for c = 1:k
        W(1:fl,c) = V(1:fl,I(c));
    end    
    out = {};
    for c = 1:length(data)
        out{c} = abs(data{c}*W);
    end
    variance = eigval(I(1:k))/sum(eigval(I(1:k)));
    fprintf('Information content of the first %d eigenpairs : %s\n',k,num2str(round(1000*variance)/1000));
end