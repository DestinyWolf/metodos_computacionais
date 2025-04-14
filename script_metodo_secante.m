x0 = 1;
x1 = 0;
tolerancia = 10e-4;
max_iter = 22;
func = @p1;

[raiz, it] = metodo_secante(func, x1, x0, tolerancia, max_iter);

fprintf('raiz: %.10f\tnumero de iteracoes: %d\n\n', raiz(it+1), it-1);
plot([1:it+1], raiz);
xlabel("Iteracao");
ylabel("Raiz");