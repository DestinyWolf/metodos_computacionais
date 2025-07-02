function valor_estimado = met_simp_1_dupla(a,b, c, d,func, valor_real)
    h1 = (b-a)/3;
    h2 = (d-c)/3;
    for i = 1:2
        if i == 1
            valor_estimado = (h1/3)*(h2/3)*(func(a, c) + 4*func((a+b)/2, c) + func(b, c));
        else
            valor_estimado = valor_estimado + 4*((h1/3)*(h2/3)*(func(a, (c+d)/2) + 4*func((a+b)/2, (c+d)/2) + func(b, (c+d)/2)));
        end
    end
    valor_estimado = valor_estimado + (h1/3)*(h2/3)*(func(a, d) + 4*func((a+b)/2, d) + func(b, d));
    x = [a:h1:b];
    y = [c:h2:d];
    fprintf("valor de x\t|\tvalor de y\t|\tvalor de f(x,y)\n")
    for i=1:3
        for j=1:3
            fprintf("%f\t|\t%f\t|\t%f\n", x(j), y(i), func(x(j), y(i)))
        end
    end

    fprintf("\nO valor estimado é de: %f\n", valor_estimado);
    erro_relativo = (abs(valor_real - valor_estimado)/valor_real)*100;
    fprintf("O erro relativo é de: %f%%\n", erro_relativo);
end