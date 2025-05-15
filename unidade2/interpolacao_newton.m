function y_interpolado = interpolacao_newton(x, x_desejado, y)

    [l,n] = size(x);

    b = zeros(n,n);
    b(:,1) = y;

    for j=2:n;
        for i=1:n-j+1
            b(i,j) = (b(i+1, j-1) - b(i,j-1))/(x(i+j-1)-x(i));
        endfor
    endfor

    xt = 1;
    y_interpolado = b(1,1);
    for j=1:n-1
        xt = xt*(x_desejado-x(j));
        y_interpolado = y_interpolado+b(1, j+1)*xt;
    endfor

endfunction