function a = regressao_polinomial(x, y, grau)

    [_, nx] = size(x);
    [_, ny] = size(y);

    if nx != ny 
        fprintf("os vetores devem ter o mesmo tamanho\n");
        return;
    else
        for i=1:grau+1
            soma_y = 0; %é atualizado uma vez por linha
            for j=1:grau+1
                soma_x = 0; %é atualizado em a cada elemnto
                for k=1:nx
                    soma_x = soma_x + x(k)^(i+j-2);
                    if (j==1) 
                        soma_y = soma_y + ((x(k)^(i+j-2))*y(k));
                    end
                end
                matriz_x(i,j) = soma_x;
            end
            vetor_y(1,i) = soma_y;
        end

        disp("matriz");
        disp(matriz_x);
        disp("vetor")
        disp(vetor_y);
        

        a = eliminacao_lu(matriz_x, vetor_y);

        fprintf("coeficientes: ");
        disp(a);

    end


end