function [x,y] = met_ralston(a,b,h,y0, func)
    x = [a:h:b];
    [_, n] = size(x)
    y(1) = y0;

    for i =1:n-1
        k(1) = func(y(i), x(i));
        k(2) = func(y(i) + k(1)*h*(3/4),x(i) + (3/4)*h)
        y(i+1) = y(i) + h*((1/3)*(k(1) + (2/3)*k(2)));

        fprintf("valor de y: %f\t|\tvalor de x: %f\n", y(i+1), x(i+1));
    endfor
end