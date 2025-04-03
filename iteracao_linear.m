function [it, r] = iteracao_linear(func, func_it, ponto_inicial, limite_erro, limite_it)
    r(1) = ponto_inicial;
    it = 1;
    for it = 1:limite_it
        r_ant = r(it);
        r(it + 1) = func_it(r(it));
        if r(it + 1) != 0
            ea = abs((r(it + 1) - r_ant)/r(it + 1))*100;
        endif

        if ea <= limite_erro    
            fprintf('iterações: %d\nraiz: %f\n', it, r(it+1));
            break;
        endif

        fprintf('iterações: %d\nraiz: %f\n', it, r(it+1));

    endfor
    if it == limite_it
        disp('limite de iteração atingido');
    endif
endfunction