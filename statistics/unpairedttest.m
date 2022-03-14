% performs a t-test on two pools of data. 
% data assumed to be a two entry cell.
function out = unpairedttest(data)
d1 = data{1};
d2 = data{2};
s = sqrt((sum((d1 - mean(d1)).^2) + sum((d2 - mean(d2)).^2))/(length(d1) + length(d2) - 2));
t = (mean(d2) - mean(d1))/(s*sqrt((1/(length(d1))) + (1/(length(d2)))));
fprintf(strcat('t =  ',num2str(t),'\n'));
fprintf(strcat('P =  ',num2str(1 - tcdf(t,length(d1)+length(d2) - 2)),'\n'));
out = [t,1 - tcdf(t,length(d1)+length(d2) - 2)];
end