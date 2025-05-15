function y_interpolado = interpolacao_lagrange(x, x_desejado, y)

    y_interpolado = 0;


    [l,n] = size(y);

    for i=1:n
        produto = y(i);
        for j=1:n
            if i != j
                produto = produto * ((x_desejado - x(j))/(x(i) - x(j)));
            endif
        endfor
        y_interpolado = y_interpolado + produto;
    endfor
end