function valor_estimado = met_trap(a,b,func, valor_real)
    h = b-a;
    valor_estimado = h * (func(a) + func(b))/2;
    valor_estimado = 12*valor_estimado;
    fprintf("O valor estimado é de: %f\n", valor_estimado);
    erro_relativo = (abs(valor_real - valor_estimado)/valor_real)*100;
    fprintf("O erro relativo é de: %f%%\n", erro_relativo);
end