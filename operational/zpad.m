function array = zpad(input,outlength,pad)
    if (outlength<length(input) && pad == 1)
        fprinf('Input signal length exceeds output length');
    else
        if pad == 1
            [a,b] = size(input);
            if a == 1
                array = [input,zeros(1,outlength - length(input))];
            else
                array = [input;zeros(outlength - length(input),1)];
            end
        else
            array = [];
            for i = flip(1:length(input))
                if input(i) ~= 0
                    array = input(1:i);
                    return
                end
            end
        end                
end