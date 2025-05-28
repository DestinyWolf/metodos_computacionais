function a = regressao_multipla(x, y)

    [l, nx] = size(x);
    [_, ny] = size(y);

    if l != ny 
        fprintf("os vetores devem ter o mesmo tamanho\n");
        return;
    else
        %utilizando a forma alternativa usando a matriz de vondermount
        for i=1:l
            for j=1:nx
                matriz_z(i,j) = (x(j))^j-1;
            end
        end

        for i=1:l
            for j=1:nx
                matriz_z_trans(j,i) = matriz_z(i,j);
            end
        end

        matriz_x = matriz_z*matriz_z_trans;
        vetor_y = y.*matriz_z_trans;


        % for i=1:l+1
        %     soma_y = 0; %é atualizado uma vez por linha 
        %     for j=1:l+1
        %         soma_x = 0; %é atualizado em a cada elemnto
        %         for k=1:nx
        %             soma_x = soma_x + x(k)^(i+j-2);
        %             if (j==1 && i) 
        %                 soma_y = soma_y + ((x(i,k))*y(k));
        %             end
        %         end
        %         matriz_x(i,j) = soma_x;
        %     end
        %     vetor_y(1,i) = soma_y;
        % end

        disp("matriz");
        disp(matriz_x);
        disp("vetor")
        disp(vetor_y);
        

        %a = eliminacao_lu(matriz_x, vetor_y);

        %fprintf("coeficientes: ");
        %disp(a);

    end


end