function [bc,ac] = ztos(bd,ad,sr)
[bc,ac] = tfdata(d2c(tf(bd,ad,1/sr),'tustin'));
bc = cell2mat(bc);
ac = cell2mat(ac);
end