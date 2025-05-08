function [x, it, itr, erro] = jacobi(A, b, tol, N, x0)


    if(!teste_diagonal(A))

        disp('a matriz não passou no criterio de linhas');
        continuar = input('deseja continua (s/n)? ', 's');
        
        if (continuar != 's')
            return
        endif
    else
        disp('A matriz passou no criterio de linhas');
    endif
    [linhas, colunas] = size(A);


    for i=1:linhas
        for j=1:linhas
            if (i == j) 
                C(i,j) = 0;
                d(i) = b(i)/A(i,i);
            else
                C(i,j) = -A(i,j)/A(i,i);
            endif
        endfor
    endfor

    k = 1;
    Erx(1) = 100;

    %calculando a primeira iteração
    for i=1:linhas
        x(k,i) = 0;
        for j=1:linhas
            x(k,i) += C(i,j) * x0(j);
        endfor
        x(k,i) += d(i);
        dr = abs(x(k,i) - x0(i));
    endfor
        
    Erx(k) = max(dr)/max(abs(x(k)));
    k = 2;
    while (k<N && Erx > tol)
        for i=1:linhas
            x(k,i) = 0;
            for j=1:linhas
                x(k,i) += C(i,j) * x(k-1,j);
            endfor
            x(k,i) += d(i);
            dr = abs(x(k,i) - x(k-1,i));
        endfor
        Erx(k) = (max(dr)/max(abs(x(k))))*100;

        disp("valores de x: ");
        disp(x(k,:));
        disp("dr em %: ")
        disp(Erx(k));
        if (Erx(k) < tol)
            break; 
        endif

        k = k + 1;
    endwhile

    if (k == N)
        disp('numero de iterações maximo atingido');
    endif
endfunction