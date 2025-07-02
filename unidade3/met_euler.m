function [x,y] = met_euler(a,b,h,y0, func)
    x = [a:h:b];
    [_, n] = size(x)
    y(1) = y0;

    for i =1:n-1
        k(1) = func(y(i), x(i));
        y(i+1) = y(i) + k(1)*h;

        fprintf("valor de y: %f\t|\tvalor de x: %f\n", y(i+1), x(i+1));
    endfor
end