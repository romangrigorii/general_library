function out = Ftest(data)
    % Ftest takes a cell of data and checks which features of it are best
    % at representing the classes by performing an F test.
    D = []; L = length(data);
    for i = 1:L
        D = [D;data{i}];
    end  
    %% finding the explained variance
    [~,l2] = size(data{1});
    EV = zeros(1,l2);
    Dmean = mean(D);
    for c = 1:L
        [l1,~] = size(data{c});
        EV = EV + l1*(mean(data{c})-Dmean).^2;
    end  
    EV = EV/(L-1);
    %% finding the unexplained variance
    UV = zeros(1,l2);
    N = 0;    
    for c = 1:L
        [l1,~] = size(data{c});
        N = N + l1;
        UV = UV + sum((data{c}-vectomat(mean(data{c}),l1)').^2);
    end   
    UV = UV/(N-L);
    out = EV./UV;
end