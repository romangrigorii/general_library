function [value,row,column] = max2D(A)
[value,column] = max(max(A));
[~,row] = max(A(:,column));
end