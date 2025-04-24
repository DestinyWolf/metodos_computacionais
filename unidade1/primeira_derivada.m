function [passo, diferenca, erro] = primeira_derivada(x, iteracoes)
    valor_verdadeiro = -(0.4*x^3) - 0.45*x^2 - 1*x - 0.25


    passo(1) = 1;
    count = 1;
    valor = (((-0.1 * (x + 0.1) ^ 4)  -  (0.15 * (x + 0.1)^3) - (0.5 * (x + 0.1) ^ 2) + 1.2) - ((-0.1 * (x - 0.1) ^ 4)  -  (0.15 * (x - 0.1)^3) - (0.5 * (x - 0.1) ^ 2) + 1.2))/(2 *passo(count));
    erro(1) = valor_verdadeiro - valor;
    diferenca(count) = valor;

    while (count < iteracoes + 1)
        count += 1;
        passo(count) = passo(count-1)/10;
        valor = (((-0.1 * (x + 0.1) ^ 4)  -  (0.15 * (x + 0.1)^3) - (0.5 * (x + 0.1) ^ 2) + 1.2) - ((-0.1 * (x - 0.1) ^ 4)  -  (0.15 * (x - 0.1)^3) - (0.5 * (x - 0.1) ^ 2) + 1.2))/(2 *passo(count));
        erro(count) = valor_verdadeiro - valor;
        diferenca(count) = valor;
    endwhile


    fprintf("tamanho do passo | diferenca finita | erro verdadeiro\n");

    for index = 1:count
        fprintf("%.10f\t|%.10f\t|%.10f\n", passo(index), diferenca(index), erro(index));
    endfor
    plot(passo, log(abs(erro)));
    xlabel("passo");
    ylabel("log do erro");
endfunction
