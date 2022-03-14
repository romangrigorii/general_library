function out = NNcodereg(input,labels,levels,plott)
[aa,bb] = size(input);
in = abs(max(labels)-min(labels)); % calculating the range of the labels for good initiation
levels = [levels,1];
a = {}; a{1} = input(1,:)'; b = {}; W = {}; s = {}; z = {};
L = length(levels);
%Forward propogating initial values
for i = 1:L
    b{i} = in*(randn(length(levels(i)),1));
    W{i} = in*(randn(levels(i),length(a{i})));
    z{i} = W{i}*a{i} + b{i};
    a{i+1} = sigmoidd(z{i},0);
end
% Back propagation
gradCw = {}; gradCb = {};
C = [];
nu = aa/L;
lim = 400; % number of epochs
for p = 1:lim
    Ccur = [];
    for j = randperm(aa)
        a{1} = input(j,:)';
        for k = 1:5
            s{L} = (a{L+1}-labels(j)).*sigmoidd(z{L},1);
            u = L-1;
            while u > 0
                s{u} = (W{u+1}'*s{u+1}).*sigmoidd(z{u},1);
                u = u - 1;
            end
            for i = 1:L
                gradCb{i} = s{i};
                gradCw{i} = s{i}*a{i}';
            end
            for i = 1:L
                W{i} = W{i} - .00005*nu*gradCw{i};
                b{i} = b{i} - .00005*nu*gradCb{i};
            end
            for i = 1:L % forward propagation the newly applied weights
                z{i} = W{i}*a{i} + b{i};
                a{i+1} = sigmoidd(z{i},0);
            end
        end
        err = [];
        for j = 1:aa
            err(j) = classifyNN(W,b,input(j,:)') - labels(j);
        end
        Ccur = [Ccur,mean(abs(err))];
    end
    fprintf('percent: %d error: %f\n',round(100*p/lim),Ccur(end));
    %fprintf('percent: %d \n',round(100*p/lim));
    for i = 1:L
        W{i} = .00001*nu*(rand(size(W{i}))) + W{i}; % applying stochasticity
        b{i} = .00001*nu*(rand(size(b{i}))) + b{i};
    end
    C = [C,mean(Ccur)];
    close 
    hold on
    plot(labels);
    plot(err + labels);
    pause(.5);
end
if plott == 1
    figure
    plot(C);
    xlabel('epoch');
    ylabel('error');
    title('Classification error as function of epochs on data set 2');
end
out{1} = W;
out{2} = b;
end