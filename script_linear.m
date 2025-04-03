x0 = 0
tolerancia = 10e-4
max_iter = 22
func = @p1
derivada = @p1_iteracao

[it, raiz] = iteracao_linear(func, derivada, x0, tolerancia, max_iter);

fprintf('raiz: %.10f\tnumero de iteracoes: %d\n\n', raiz(it+1), it);
plot([1:it+1], raiz);
xlabel("Iteracao");
ylabel("Raiz");