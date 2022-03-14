function M = normalize_img(mat,Mo,Vo)
% Given a matrix of greyscale pixel values mat, normalize_img() will set
% the mean value of the given matrix to Mo and the variance to Vo
m = mean(mean(mat));
[S1,S2] = size(mat);
varr = zeros(S1,S2);
M = mat;
for s1 = 1:S1
    for s2 = 1:S2
        varr(s1,s2) = (M(s1,s2) - m)^2;
    end
end
v = sum(sum(varr))/S1/S2;
for s1 = 1:S1
    for s2 = 1:S2
        i = M(s1,s2);
        if i>m
            M(s1,s2) = Mo + sqrt(Vo/v)*abs(i-m);
        else
            M(s1,s2) = Mo - sqrt(Vo/v)*abs(i-m);
        end
    end
end
end
