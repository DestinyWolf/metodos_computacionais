function valor_final = calcexp()
    valor_verdadeiro = exp(0.5);
    tolerancia = (0.5e-3)/100;

    valor = 1;
    count = 1;

    erro_relativo(1) = ((valor_verdadeiro - valor)/valor_verdadeiro)/100;
    while (tolerancia < abs(erro_relativo))
        valor =  valor + (0.5^count)/factorial(count);
        erro_relativo(count+1) = ((valor_verdadeiro - valor)/valor_verdadeiro)/100;
        count+=1;
    endwhile
    for index = 1:count
        fprintf('erro relativo: %f\n', erro_relativo(index));
    endfor

    valor_final = valor;
endfunction
