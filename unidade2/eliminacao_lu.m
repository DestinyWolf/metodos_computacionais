function val_var = eliminacao_lu(matriz_a, matriz_b)
    [lin, col] = size(matriz_a);


    if lin == col || det(matriz_a) != 0
        matriz_l = tril(ones(lin, col));
        matriz_u = ones(lin, col);
        for j = 1:lin-1
            pivo = matriz_a(j,j);
            for i = j+1:lin
                fator = matriz_a(i,j)/pivo;
                matriz_a(i,:) = matriz_a(i,:) - (fator * matriz_a(j,:));
                matriz_l(i,j) = fator;
            endfor

            fprintf('eliminação %d\nmatriz L\n',j);
            disp(matriz_l)
            fprintf('matriz u\n');
            disp(matriz_a)
        endfor

        matriz_u = matriz_a;

        vetor_y = gauss_with_pivo(matriz_l, matriz_b);
        val_var = gauss_with_pivo(matriz_u, vetor_y);
    endif
endfunction