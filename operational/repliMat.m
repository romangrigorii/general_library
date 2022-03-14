%% this function replicates the matrix mat n times across columns
function out = repliMat(mat,n)
out = mat;
for i = 1:n-1
    out = [out,mat];
end
end