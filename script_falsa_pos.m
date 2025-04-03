limite_superior = 0.34
limite_inferior = 0.3
limite_erro = 0.001
f = @p3
limite_iteracoes = 22

[k, a, fa, b, fb, r, fr, Tinterv] = met_falsa_posicao(f, limite_inferior, limite_superior, limite_erro, limite_iteracoes);

for item = 1:k
    fprintf("i: %d\tlim inf: %.10f\tf(a): %.20f\tlim sup: %.10f\tf(b): %.20f\traiz: %.20f\tf(r): %.20f\tTinterv: %.20f\n\n", item, a(item), fa(item),
    b(item), fb(item), r(item), fr(item), Tinterv(item));
endfor

fprintf('raiz: %.20f\tIteração: %d\n', r(k), k);