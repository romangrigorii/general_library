function [dx,dy] = gradx(mat,type)
% takes second derivative of matrix entries in x and y direction
% last updated on 09/21/2018 by Roman V. Grigorii
[X,Y] = size(mat);
dx = zeros(X,Y);
dy = zeros(X,Y);
switch type
    case 1
        for x = 1:X
            for y = 1:Y
                a = x*(x<X)*(x>1) + (x==1)*2 + (x==X)*(X-1);
                b = y*(y<Y)*(y>1) + (y==1)*2 + (y==Y)*(Y-1);         
                dx(x,y) = (mat(a-1,b)-2*mat(a,b)+mat(a+1,b))/2;
                dy(x,y) = (mat(a,b-1)-2*mat(a,b)+mat(a,b+1))/2;
            end
        end    
    case 2
        for x = 1:X
            for y = 1:Y
                a = x*(x<X)*(x>1) + (x==1)*2 + (x==X)*(X-1);
                b = y*(y<Y)*(y>1) + (y==1)*2 + (y==Y)*(Y-1);         
                dx(x,y) = (mat(a-1,b)-2*mat(a,b)+mat(a+1,b))/2;
                dy(x,y) = (mat(a,b-1)-2*mat(a,b)+mat(a,b+1))/2;
            end
        end        
end