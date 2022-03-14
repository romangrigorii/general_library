function [outx,outy] = derivR2(data,order,sr)
outx = data;
outy = data;
switch (order)
    case 1
        outx(2:end-1,:) =  (data(3:end,:) - data(1:end-2,:))/2*sr;   
        outx(1,:) = (data(2,:) - data(1,:))/2*sr;   
        outx(end,:) = (data(end,:) - data(end-1,:))/2*sr;   
        outy(:,2:end-1) =  (data(:,3:end) - data(:,1:end-2))/2*sr;   
        outy(:,1) = (data(:,2) - data(:,1))/2*sr;   
        outy(:,end) = (data(:,end) - data(:,end-1))/2*sr;       
    case 2
        
end

end