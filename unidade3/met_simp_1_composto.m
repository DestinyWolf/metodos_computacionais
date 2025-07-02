function valor_estimado = met_simp_1_composto(a,b,func, num_intervalos, valor_real)
    if mod(num_intervalos, 2) != 0
        disp("O numero de subintervalos deve ser par")
        return
    else
        fprintf("valor de x\t|\tvalor de f(x)\t|\titeração\n");
        h = (b-a)/num_intervalos;
        soma = 0;
        for i = 1:1:num_intervalos+1
            if i == 1 || i == num_intervalos+1
                soma = soma + func(a + (i-1)*h);
            else 
                if mod(i, 2) == 0
                    soma = soma + 4*func(a + (i-1)*h);
                else
                    soma = soma + 2*func(a + (i-1)*h);
                end
            end
            
            fprintf("%f\t|\t%f\t|\t%d\n", a + (i-1)*h, func(a + (i-1)*h), i);
        end
        valor_estimado = (h/3)*soma;
        valor_estimado = 12*valor_estimado;
        fprintf("O valor estimado é de: %f\n", valor_estimado);
        erro_relativo = (abs(valor_real - valor_estimado)/valor_real)*100;
        fprintf("O erro relativo é de: %f%%\n", erro_relativo);
    end
end