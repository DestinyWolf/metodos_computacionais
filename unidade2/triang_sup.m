function x = triang_sup(mat_u, y)
    [l, n] = size(mat_u);
    x(n) = y(n)/mat_u(n,n);

    for i = n-1:-1:1
        x(i) = (y(i)-mat_u(i, i+1:n)*x(i+1:n)')/mat_u(i,i);
    end

end