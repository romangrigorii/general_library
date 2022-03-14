function ima_out = image_filt(I,c1,c2,operation,n,pass)
I = double(I);
Ifft = fftshift(fft2(fftshift(I)));
s = size(I);
z = zeros(size(s));
switch operation
    case 1 % Ideal Bandpass Filter
        for i = 1:s(1)
            for j = 1:s(2)
                r = sqrt((i-1-s(1)/2)^2+(j-1-s(2)/2)^2);                
                if( r < c1) && (strcmp(pass,'hp') || strcmp(pass,'bp'))
                    z(i,j) = 0;
                else
                    if(r > c1) && strcmp(pass,'lp')
                        z(i,j) = 0;
                    elseif ( r > c2) && strcmp(pass,'bp')                    
                        z(i,j) = 0;
                    else
                        z(i,j) = 255;
                    end
                end                
            end
        end
    case 2 % Bandpass Butterworth Filter
        for i = 1:s(1)
            for j = 1:s(2)
                d = sqrt((i-1-s(1)/2)^2+(j-1-s(2)/2)^2);
                switch pass
                    case 'lp'
                        z(i,j) = (1/(1+(d/c1)^(2*n)));
                    case 'hp'
                        z(i,j) = (1 - (1/(1+(d/c1)^(2*n))));
                    case 'bp'
                        z(i,j) = (1/(1+(d/c1)^(2*n)))*(1 - (1/(1+(d/c2)^(2*n))));
                end
            end
        end
    case 3 % Gaussian filter
        for i = 1:s(1)
            for j =1:s(2)
                d = (i-1-s(1)/2)^2+(j-1-s(2)/2)^2;
                switch pass
                    case 'lp'
                        z(i,j) = exp(-d/(2*n*c1^2));
                    case 'hp'
                        z(i,j) = 1 - exp(-d/(2*n*c1^2));
                    case 'bp'
                        z(i,j) = exp(-d/(2*n*c1^2)).*(1 - exp(-d/(2*n*c2^2)));
                end
            end
        end
        
end
Ifft=Ifft.*z;
ima_out = fftshift(ifft2(fftshift(Ifft)));
end
