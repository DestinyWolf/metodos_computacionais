function x = triang_inf(mat_l, b)

    [l, n] = size(mat_l);

    x(1) = b(1)/mat_l(1,1);

    for i=2:n
        x(i) = (b(i)-mat_l(i, 1:i-1)*x(1:i-1)')/mat_l(i,i);
    end

end