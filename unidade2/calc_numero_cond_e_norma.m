function [norma_c, norma_l, norma_e, num_cond] = calc_numero_cond_e_norma(matriz_a)
    
    %calculo da matriz inversa usando o algoritmo de gauss_jordan
    [l, n] = size(matriz_a);
    ident = eye(n);

    mat_aumentada = [matriz_a, ident];

    for i=1:n
        pivo = mat_aumentada(i,i);
        mat_aumentada(i,:) = mat_aumentada(i,:)/pivo;

        for j = 1:n
            if j != i
                fator = mat_aumentada(j,i);
                mat_aumentada(j,:) = mat_aumentada(j, :)-fator*mat_aumentada(i, :);
            endif
        endfor

    endfor

    inversa = mat_aumentada(:, n+1:end);

    fprintf("Matriz inversa: \n");
    disp(inversa);
    
    %Calculo da norma e numero condiçao
    norma_l_somatorio(1:n) = 0;
    norma_c_somatorio(1:n) = 0;
    norma_e_somatorio = 0;
    norma_e_somatorio_inversa = 0;

    for i=1:n
        for j=1:n
            norma_e_somatorio += (matriz_a(i,j))^2;
            norma_l_somatorio(i) += abs(matriz_a(i,j));
            norma_c_somatorio(j) += abs(matriz_a(i,j));
            norma_e_somatorio_inversa += (inversa(i,j)^2);
        endfor
    endfor

    norma_l = max(norma_l_somatorio);
    norma_c = max(norma_c_somatorio);
    norma_e = sqrt(norma_e_somatorio);
    norma_e_inversa = sqrt(norma_e_somatorio_inversa);
    num_cond = norma_e * norma_e_inversa;
    
endfunction