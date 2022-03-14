function out = medfilt(seq)

if seq(1)>seq(2)
    a = seq(2);
    b = seq(1);
else
    a = seq(1);
    b = seq(2);
end

entries = [a,b];
po = 1.5;

for e = 3:length(seq)
    pos = ceil(po);
    if seq(e)>entries(round(pos))
        if seq(e)<entries(pos+1)
            entries = [entries(1:pos),seq(e),entries(pos+1:end)];
        else
            entries = [entries(1:pos+1),seq(e),entries(pos+1:end)];
        end
    else        
        entries = [entries(1:pos-1),seq(e),entries(pos:end)];        
    end
    po = po + .5;
end
entries
out = entries(pos);
        
end