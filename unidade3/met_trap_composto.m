function valor_estimado = met_trap_composto(a, b,func, num_intervalos, valor_real)
    h = (b-a)/num_intervalos;
    x(1) = a;
    somatorio = func(x(1));
    fprintf("valor de x\t|\tvalor de f(x)\t|\titeração\n");
    fprintf("%f\t|\t%f\t|\t%d\n", x(1), func(x(1)),1);
    for i = 2:num_intervalos
        x(i) = x(i-1) + h;
        somatorio = somatorio + 2*func(x(i));
        fprintf("%f\t|\t%f\t|\t%d\n", x(i), func(x(i)), i)
    end
    x(num_intervalos+1) = x(num_intervalos) + h;
    somatorio = somatorio + func(x(num_intervalos+1));
    valor_estimado = (h/2)*somatorio;
    valor_estimado = 12*valor_estimado;
    fprintf("%f\t|\t%f\t|\t%d\n\n", x(num_intervalos+1), func(x(num_intervalos+1)), num_intervalos+1);
    fprintf("\nO valor estimado é de: %f\n", valor_estimado);
    erro_relativo = (abs(valor_real - valor_estimado)/valor_real)*100;
    fprintf("O erro relativo é de: %f%%\n", erro_relativo);
end