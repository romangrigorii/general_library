function out = createfilm(moviename)
film = cell(3,1);
images = dir;
images = images(3:end);
for m = 1:length(images)
    name = images(m).name;
    film{m} = imread(name);
end
writerObj = VideoWriter(moviename);
writerObj.FrameRate = 1;
open(writerObj);
secsperimage = 10/125*ones(length(images),1);
for m = 1:length(images)
    frame = im2frame(film{m});
    writeVideo(writerObj,frame);
end
close(writerObj);
end