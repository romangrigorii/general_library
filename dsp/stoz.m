function [bd,ad] = stoz(bc,ac,sr)
[bd,ad] = tfdata(c2d(tf(bc,ac),1/sr,'tustin'));
bd = cell2mat(bd);
ad = cell2mat(ad);
end