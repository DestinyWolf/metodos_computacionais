function [k, a, fa, b, fb, r, fr, Tinterv] = met_falsa_posicao(func, lm_inf, lm_sup, max_erro, max_iter)
    k = 1;
    a(k) = lm_inf;
    fa(k) = func(a(k));
    b(k) = lm_sup;
    fb(k) = func(b(k));
    
    while (abs(b(k)-a(k)) > max_erro) && (k < max_iter)
        r(k) = (a(k)*fb(k) - b(k)*fa(k))/(fb(k)-fa(k));
        fr(k) = func(r(k));
        Tinterv(k) = b(k) - a(k);

        if fa(k) * fr(k) <= 0
            a(k+1) = a(k);
            b(k+1) = r(k);
        else
            a(k+1) = r(k);
            b(k+1) = b(k);
        endif
        k = k + 1;
        fa(k) = func(a(k));
        fb(k) = func(b(k));
    endwhile

    if (k == max_iter)
        disp('Numero de iteracoes atingido');
    endif

    r(k) = (a(k)*fb(k) - b(k)*fa(k))/(fb(k)-fa(k));
    fr(k) = func(r(k));
    Tinterv(k) = b(k) - a(k);

    plot([1:k], r);
    xlabel('iteracoes');
    ylabel('raiz aproximada');
end