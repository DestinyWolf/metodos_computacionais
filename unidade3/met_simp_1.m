function valor_estimado = met_simp_1(a,b,func, valor_real)
    h = (b-a)/3;
    valor_estimado = (h/3)*(func(a) + 4*func((a+b)/2) + func(b));
    fprintf("valor de x\t|\tvalor de f(x)\t|\titeração\n")
    for i=1:3
        if (i == 1)
            x(i) = a;
        else
            if (i == 2)
                x(i) = (a+b)/2;
            else
            x(i) = b;
            end
        end
        y(i) = func(x(i));
        fprintf("%f\t|\t%f\t|\t%d\n", x(i), y(i),i);
    end
    valor_estimado = 12*valor_estimado;
    fprintf("\nO valor estimado é de: %f\n", valor_estimado);
    erro_relativo = (abs(valor_real - valor_estimado)/valor_real)*100;
    fprintf("O erro relativo é de: %f%%\n", erro_relativo);
end