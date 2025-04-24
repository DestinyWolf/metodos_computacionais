function [r, it] = metodo_secante(func, x1, x0, limite_erro, max_iter)

    r(1) = x0;
    r(2) = x1;
    erro(1) = 100;
    
    for it = 2:max_iter+2
        r(it + 1) = (r(it-1) * func(r(it)) - r(it) * func(r(it-1))) / (func(r(it)) - func(r(it-1)));

        ea = abs((r(it+1) - r(it))/r(it+1)) * 100;

        erro(it) = ea;
        if ea <= limite_erro
            fprintf('raiz: %.10f\tIteração: %d\terro: %.10f\n', r(it+1), it-1, erro(it));
            break;
        endif
        fprintf('raiz: %.10f\tIteração: %d\terro: %.10f\n', r(it+1), it-1, erro(it));
    endfor
end