%% sorts the array from low to high values
function out = quicksort(arr)
e = length(arr);
if e>2
    arr1 = [];
    arr2 = [];
    pp = 0;
    while isempty(arr1)||isempty(arr2)
        arr1 = [];
        arr2 = [];
        pp = pp + 1;
        for i = 1:e
            if arr(i)<arr(pp)
                arr1 = [arr1,arr(i)];
            else
                arr2 = [arr2,arr(i)];
            end
        end
    end
    out = [quicksort(arr1),quicksort(arr2)];
else
    if e == 2
        if (arr(1)<arr(e))
            out = arr;
        else
            out = [arr(2),arr(1)];
        end
    else
        out = arr;
    end
end
end
