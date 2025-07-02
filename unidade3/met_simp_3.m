function valor_estimado = met_simp_3(a,b,func, valor_real)
    h = (b-a)/3;
    valor_estimado = 3*h*(func(a) + 3*(func(a+h) + func(a+2*h)) + func(b))/8;
    valor_estimado = 12*valor_estimado;
    fprintf("valor de x\t|\tvalor de f(x)\t|\titeração\n")
    for i=1:4
        x(i) = a + (i-1)*h;
        y(i) = func(x(i));
        fprintf("%f\t|\t%f\t|\t%d\n", x(i), y(i),i);
    end
    fprintf("\nO valor estimado é de: %f\n", valor_estimado);
    erro_relativo = (abs(valor_real - valor_estimado)/valor_real)*100;
    fprintf("O erro relativo é de: %f%%\n", erro_relativo);
end