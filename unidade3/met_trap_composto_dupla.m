function valor_estimado = met_trap_composto_dupla(a, b, c, d,func, num_intervalos, valor_real)
    h1 = (b-a)/num_intervalos;
    h2  = (d-c)/num_intervalos;
    fprintf("valor de x\t|\tvalor de y\t|\tvalor de f(x,y)\t|\titeração\n");
    for i = 1:num_intervalos
        if i == 1
            y(i) = c;
            for j = 1:num_intervalos
                if j == 1
                    x(j) = a;
                    somatorio = func(x(j), y(i));
                    fprintf("%f\t|\t%f\t|\t%f\t|\t%d\n", x(j),y(i), func(x(j), y(i)), i);
                else
                    x(j) = x(j-1) + h1;
                    somatorio = somatorio + 2*func(x(j), y(i));
                    fprintf("%f\t|\t%f\t|\t%f\t|\t%d\n", x(j),y(i), func(x(j), y(i)), i);
                end
            end
            x(num_intervalos+1) = x(num_intervalos) + h1;
            fprintf("%f\t|\t%f\t|\t%f\t|\t%d\n", x(num_intervalos+1),y(i), func(x(num_intervalos+1), y(i)), i);
            somatorio = somatorio + func(x(num_intervalos+1), y(i));
            valor_estimado = (h1/2)*(h2/2)*somatorio;
        else
            y(i) = y(i-1) + h2;
            for j = 1:num_intervalos
                if j == 1
                    x(j) = a;
                    somatorio = func(x(j), y(i));
                    fprintf("%f\t|\t%f\t|\t%f\t|\t%d\n", x(j),y(i), func(x(j), y(i)), i);
                else
                    x(j) = x(j-1) + h1;
                    somatorio = somatorio + 2*func(x(j), y(i));
                    fprintf("%f\t|\t%f\t|\t%f\t|\t%d\n", x(j),y(i), func(x(j), y(i)), i);
                end
            end
            x(num_intervalos+1) = x(num_intervalos) + h1;
            somatorio = somatorio + func(x(num_intervalos+1), y(i));
            valor_estimado = valor_estimado+ (h1)* (h2/2)*somatorio;
            fprintf("%f\t|\t%f\t|\t%f\t|\t%d\n", x(num_intervalos+1),y(i), func(x(num_intervalos+1), y(i)), i);
        end
    end
    y(num_intervalos+1) = y(num_intervalos) + h2;
    for j = 1:num_intervalos
        if j == 1
            x(j) = a;
            somatorio = func(x(j), y(i));
            fprintf("%f\t|\t%f\t|\t%f\t|\t%d\n", x(j),y(i), func(x(j), y(i)), num_intervalos+1);
        else
            x(j) = x(j-1) + h1;
            somatorio = somatorio + 2*func(x(j), y(i));
            fprintf("%f\t|\t%f\t|\t%f\t|\t%d\n", x(j),y(i), func(x(j), y(i)), num_intervalos+1);
        end
    end
    x(num_intervalos+1) = x(num_intervalos) + h1;
    somatorio = somatorio + func(x(num_intervalos+1), y(i));
    valor_estimado = valor_estimado+ (h1/2)*(h2/2)*somatorio;
    fprintf("%f\t|\t%f\t|\t%f\t|\t%d\n\n", x(num_intervalos+1),y(num_intervalos+1), func(x(num_intervalos+1), y(num_intervalos+1)), num_intervalos+1);
    fprintf("O valor estimado é de: %f\n", valor_estimado);
    erro_relativo = (abs(valor_real - valor_estimado)/valor_real)*100;
    fprintf("O erro relativo é de: %f%%\n", erro_relativo);
end