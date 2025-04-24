function [r, it] = metodo_newton(func, func_derivada, x0, tol, max_iter)
    r(1) = x0;

    for it = 1:max_iter+1
        r(it+1) = r(it) - (func(r(it))/func_derivada(r(it)));


        ea = abs((r(it+1) - r(it))/r(it+1)) * 100;

        if ea <= tol
            fprintf('iteração: %d\traiz: %.10f\terro: %.10f\n', it, r(it+1), ea);
            break;
        endif
        fprintf('iteração: %d\traiz: %.10f\terro: %.10f\n', it, r(it+1), ea);
    endfor
end