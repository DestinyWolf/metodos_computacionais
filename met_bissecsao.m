function [k, a, fa, b, fb, r, fr, Tinterv] = met_bissecsao(func, lm_inf, lm_sup, erro, lm_iteracao)
    k = 1;
    a(k) = lm_inf;
    fa(k) = func(a(k));
    b(k) = lm_sup;
    fb(k) = func(b(k));
    while (abs(b(k) - a(k)) > erro) && (k < lm_iteracao)
        r(k) = (a(k) + b(k))/2;
        fr(k) = func(r(k));
        Tinterv(k) = b(k) - a(k);
        
        if (fa(k) * fr(k) <= 0)
            b(k+1) = r(k);
            a(k+1) = a(k);
        else
            b(k+1) = b(k);
            a(k+1) = r(k);
        endif
        k = k + 1;
        fa(k) = func(a(k));
        fb(k) = func(b(k));
    endwhile

    if (k == lm_iteracao)
        disp('Numero de iteracoes atingido');
    endif

    r(k) = (a(k) + b(k))/2;
    fr(k) = func(r(k));
    Tinterv(k) = b(k) - a(k);

    plot([1:k], r);
    xlabel('iteracoes');
    ylabel('raiz aproximada');
    
endfunction