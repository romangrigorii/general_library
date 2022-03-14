%% pink_filter_R generates pink filter using a stacked series of 1st order low pass filters
%  The given signal will pass through this filer and the output will be
%  returned
%* fc1   == low frequency cutoff
%* fc2   == high frequency cutoff
%* sr    == sampling rate
%* input == the input signal which will be passed through the pink filter
%                modified 8/24/2017 by Roman V. Grigorii
function out = pink_filter(fc1,fc2,sr,input)
    banks = ceil(log10(fc2/fc1))+1;
    out = zeros(banks,length(input));
    for p = 1:banks
        wc = tan(fc1*(10^(p-1))*pi/sr); % biliniar transformation correction      
        for i = 2:length(input)
            out(p,i) = (wc/(wc+1)*(input(i-1)+input(i)) + (1-wc)/(wc+1)*(out(p,i-1)));
        end
        out(p,:) = out(p,:)*(10^(-(p-1)/2));
    end
    out = sum(out);
end