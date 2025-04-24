function val_var = gauss_jordan(matriz_a,matriz_b)

    if det(matriz_a) != 0
        [linhas, colunas] = size(matriz_a);

        for k = 1: (linhas)
            [maior, Ind] = max(abs(matriz_a(k:linhas, k)));
            ipr = Ind + k - 1; %corrige o indice da linha

            if ipr != 0
                disp('realizou pivoteamento');
                Aux = matriz_a([k, ipr],:);
                matriz_a([k, ipr],:) = matriz_a([ipr, k],:);
                matriz_a([ipr, k],:) = Aux
                Aux = matriz_b(k);
                matriz_b(k) = matriz_b(ipr);
                matriz_b(ipr) = Aux;
                matriz_a;
                matriz_b;
            endif

            aux = matriz_a(k,k);
            matriz_a(k,:) = matriz_a(k,:)/aux;
            matriz_b(k) = matriz_b(k)/aux;

            if k == 1 
                for i = (k+1) : linhas
                    fator = matriz_a(i,k) / matriz_a(k,k);
                    for j = k : linhas
                        matriz_a(i,j) = matriz_a(i,j) - (fator * matriz_a(k,j)); 
                    endfor
                    matriz_b(i) = matriz_b(i) - (fator * matriz_b(k));
                endfor
            else
                for i = (k - (k-1)) : linhas
                    if i != k
                        fator = matriz_a(i,k) / matriz_a(k,k);
                        for j = k : linhas
                            matriz_a(i,j) = matriz_a(i,j) - (fator * matriz_a(k,j)); 
                        endfor
                        matriz_b(i) = matriz_b(i) - (fator * matriz_b(k));
                    endif
                endfor
            endif
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

end