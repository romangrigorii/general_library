function out = com(mat)
% computes a center of mass of a matrix
xx = sum(mat');
xloc = 0;
sx = 0;
for i = 1:length(xx)
    xloc = xloc + i*xx(i);
    sx = sx + xx(i);
end
yy = sum(mat);
yloc = 0;
sy = 0;
for i = 1:length(yy)
    yloc = yloc + i*yy(i);
    sy = sy + yy(i);
end
out = [xloc/sx,yloc/sy];
end