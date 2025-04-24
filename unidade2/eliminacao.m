function val_var = eliminacao(matriz_a, matriz_b)

    if det(matriz_a) != 0
        [linhas, colunas] = size(matriz_a);

        for k = 1: (linhas - 1)
            for i = (k+1) : linhas
                fator = matriz_a(i,k) / matriz_a(k,k);
                for j = k : linhas
                    matriz_a(i,j) = matriz_a(i,j) - (fator * matriz_a(k,j)); 
                endfor
                matriz_b(i) = matriz_b(i) - (fator * matriz_b(k));
            endfor
            fprintf("eliminação %d\n", k);
            fprintf("matriz A:\n");
            disp(matriz_a);
            fprintf("matriz B:\n");
            disp(matriz_b);
        endfor

        val_var(linhas) = matriz_b(linhas)/matriz_a(linhas,colunas);
        fprintf("valor x%d = ", linhas);
        disp(val_var(linhas));

        for i = (linhas -1):-1:1
            soma = matriz_b(i);
            for j = (i + 1):linhas
                soma = soma - (matriz_a(i,j) * val_var(j));
            endfor
            val_var(i) = soma / matriz_a(i,i);
            fprintf("valor x%d = ", i);
            disp(val_var(i));
        endfor
    endif
endfunction