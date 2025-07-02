function [x,y] = met_rugenk_4(a,b,h,y0, func)
    x = [a:h:b];
    [_, n] = size(x)
    y(1) = y0;

    for i =1:n-1
        k(1) = func(y(i), x(i));
        k(2) = func(y(i) + k(1)*(h/2), x(i) + h);
        k(3) = func(y(i) + (h/2)*k(2), x(i) + h);
        k(4) = func(y(i) + h*k(3), x(i)+h);
        y(i+1) = y(i) + (h/6)*(k(1) + 2*k(2) + 2*k(3) + k(4));

        fprintf("valor de y: %f\t|\tvalor de x: %f\n", y(i+1), x(i+1));

    endfor 

    plot(x, y, "r-");
    xlabel("Ano");
    ylabel("população");
    legend("metodo de HK 4 ordem");
end