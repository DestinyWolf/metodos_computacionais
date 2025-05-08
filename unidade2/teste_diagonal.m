function convergencia = teste_diagonal(A)

    [linhas, colunas] = size(A);

    for i=1:linhas

        soma(i) = 0;
%        diagonal(i) = 0;

        for j=1:linhas
            if (j != i)
                soma(i) = soma(i) + abs(A(i,j));
            else
                diagonal(i) = abs(A(i,j));
            endif
        endfor
    endfor

    if (diagonal > soma)
        convergencia = true;
    else
        convergencia = false;
    endif

endfunction