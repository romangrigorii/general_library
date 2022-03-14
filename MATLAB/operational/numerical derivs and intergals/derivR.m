function out = derivR(data,order,sr)
% takes the first derivative of data. order sets the derivative order and
% sr the sampling rate
% updated 09/21/2018
out = data;
L = length(out);
switch (order)
    case 1
        out(2:(L-1)) =  (data(3:end) - data(1:end-2))/2*sr;    
    case 2
        out(2:(L-1)) =  (data(3:end) + data(1:end-2) - 2*data(2:end-1))*(sr^2); 
end
out(1) = out(2);
out(end) = out(end-1);
end