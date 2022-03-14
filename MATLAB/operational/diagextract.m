function out = diagextract(mat)
    [a,~] = size(mat);
    out = [];
    for i = 1:a
        out(i) = mat(i,i);
    end
end