x0 = 0.3
tolerancia = 0.001
max_iter = 22
func = @p3
derivada = @p3_derivada

[raiz, it] = metodo_newton(func, derivada, x0, tolerancia, max_iter);

fprintf('raiz: %.10f\tnumero de iteracoes: %d\n\n', raiz(it+1), it-1);
plot([1:it+1], raiz);
xlabel("Iteracao");
ylabel("Raiz");