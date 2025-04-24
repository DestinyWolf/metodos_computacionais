limite_superior = 1.6;
limite_inferior = 1.4;
limite_erro = 0.001;
f = @p6;
limite_iteracoes = 22;

[k, a, fa, b, fb, r, fr, Tinterv] = met_bissecsao(f, limite_inferior, limite_superior, limite_erro, limite_iteracoes);

for item = 1:k
    fprintf("i: %d\tlim inf: %.10f\tf(a): %.10f\tlim sup: %.10f\tf(b): %.10f\traiz: %.10f\tf(r): %.10f\tTinterv: %.10f\n\n", item, a(item), fa(item),
    b(item), fb(item), r(item), fr(item), Tinterv(item));
endfor

fprintf('raiz: %.20f\tIteração: %d\n', r(k), k);