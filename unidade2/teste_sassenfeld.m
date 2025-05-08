function convergencia = teste_sassenfeld(A)
    [linhas, colunas] = size(A);

    for i=1:linhas
        betha(i) = 0;
        if (i==1)
            for j=2:linhas
                betha(i) += abs(A(i,j));
            endfor
        else
            for j=1:i-1
                betha(i) += abs(A(i,j))*betha(j);
            endfor
            for j=i+1:linhas
                betha += abs(A(i,j));
            endfor
        endif
        betha(i) = betha(i)/A(i,i);
    endfor

    if(max(betha) < 1)
        convergencia = true;
    else
        convergencia = false;
    endif

end