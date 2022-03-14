function finished = normalize_img_loc(I,Mo,w)
% Given matrix I, returns a matrix with locally normalized pixel values to
% the mean value of Mo. The nighborhood of a given pixel is in the box of
% size 2w(1)+1 by w(2)+1 around it.
S = size(I);
W = floor(S./w);
finished = ones(S)*Mo;
N2 = prod(w);
for Wx = 1:W(1)
    for Wy = 1:W(2)
        cx = Wx*w(1) - (w(1)-1)/2;       
        cy = Wy*w(2) - (w(2)-1)/2;        
        cordsx1 = (cx - (w(1)-1)/2):(cx +(w(1)-1)/2);
        cordsy1 = (cy - (w(2)-1)/2):(cy +(w(2)-1)/2);
        cordsx2 = (cx - (w(1)-1)):(cx +(w(1)-1));
        cordsy2 = (cy - (w(2)-1)):(cy +(w(2)-1));        
        cordsx2 = cordsx2.*(cordsx2>0).*(cordsx2<=S(1)) + (cordsx2<1).*(S(1)+ cordsx2) + (cordsx2>S(1)).*(cordsx2 - S(1)); 
        cordsy2 = cordsy2.*(cordsy2>0).*(cordsy2<=S(2)) + (cordsy2<1).*(S(2)+ cordsy2) + (cordsy2>S(2)).*(cordsy2 - S(2));        
        rect = I(cordsx1,cordsy1) + Mo - mean(mean(I(cordsx2,cordsy2)));        
        finished((Wx-1)*w(1)+1:Wx*w(1),(Wy-1)*w(2)+1:Wy*w(2)) = rect;
    end
end
end
