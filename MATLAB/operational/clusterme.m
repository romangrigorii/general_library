function out = clusterme(input,dist,alg)
    out = {};
    function D = d(dist,data1,data2)
        switch dist
            case 'manh'
                D = sum(abs(data1-data2));
            case 'eucl'
                D = sqrt(sum((data1-data2).^2));
        end
    end
    switch alg
        case 'DB'
            N = length(input);
            D = [];
            C = [];
            r = [];
            for ci = 1:N
                seti = input{ci};
                [Li,p] = size(seti);
                C(ci,1:p) = mean(seti);
                Di = [];
                for i = 1:Li
                    Di = [Di,d('eucl',C(ci,1:p),seti(i,:))];
                end
                D = [D,mean(Di)];
            end
            for i = 1:N
                Lj = 1:N;
                Lj = Lj(Lj~=i);
                V = [];
                for j = Lj
                    V = [V,(D(i)+D(j))/(d('eucl',C(i,:),C(j,:)))];
                end
                r = [r,max(V)];
            end
            out = {};
            out{1} = mean(r);       
        case 'SI'
            s = [];
            N = length(input);
            simMAT = [];
            AA = [];
            BB = [];
            for ci = 1:N
                %fprintf('working on cluster %d\n',ci);
                seti = input{ci};
                [Li,~] = size(seti);
                for i = 1:Li
                    A = [];
                    B = [];
                    point = seti(i,:);
                    Lset = 1:1:Li;
                    Lset = Lset(Lset~=i);
                    a = [];
                    for j = Lset
                        a = [a,d(dist,seti(i,:),seti(j,:))];
                    end
                    AA = [AA,mean(a)];
                    A = [A,AA(end)];
                    Nset = 1:1:N;
                    Nset = Nset(Nset~=ci);
                    for cj = Nset
                        setj = input{cj};
                        [Lj,~] = size(setj);
                        b = [];
                        for j = 1:Lj
                            b = [b,d(dist,seti(i,:),setj(j,:))];
                        end
                        BB = [BB,mean(b)];
                        B(i,cj) = BB(end);
                    end
                end
                simMAT(ci,ci) = mean(A);
                simMAT(ci,Nset) = mean(squeeze(B(B~=0)));
            end
            S = zeros(length(AA),1);
            for i = 1:length(AA)
                S(i) = (BB(i)-AA(i))/max(BB(i),AA(i));
            end
            out{1} = mean(S);
            out{2} = simMAT;
    end
end