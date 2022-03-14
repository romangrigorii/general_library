function int = integralr(fun,start,en,C)
res = 100;
Dt = (en-start)/length(fun);
dt = Dt/res;
ax1 = (en-start)*linspace(0,1,length(fun));
ax2 = (en-start)*linspace(0,1,res*length(fun));
funn = interp1(ax1,fun,ax2);
int = funn;
int = [0];
for i = 2:length(funn)
    a = (funn(i)+funn(i-1))/2;
    int(i) = int(i-1)+a*dt;
end
int = interp1(ax2,int,ax1);
int = int + C;
end