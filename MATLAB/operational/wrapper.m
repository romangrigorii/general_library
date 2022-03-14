%% ** Roman V. Grigorii 01/18/2022 | 02/04/2022 (created | edited)
% This function wraps around val to fall between the extremes of a given
% range of values specified by minval and maxval. type 0 performs a true
% wrap around and type 1 will thtreshold the val to the min or max

function out = wrapper(val,minval,maxval,type)
switch type
    case 0
        out = val.*(val>=minval & val<=maxval) + (val>maxval).*(val-maxval+minval) + (val<minval).*(val-minval+maxval+1);
    case 1
        out = val.*(val>=minval & val<=maxval) + (val>maxval).*maxval + (val<minval).*minval;
end