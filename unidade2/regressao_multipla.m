function a = regressao_multipla(x, y)

    [lx, nx] = size(x);
    [ly, ny] = size(y);

    if lx != ny
        fprintf("os vetores devem ter o mesmo tamanho\n");
        return;
    else
        %utilizando a forma alternativa usando a matriz de vondermount
        % for i=1:lx+1
        %     for j=1:nx
        %         matriz_z(i,j) = (x(j))^(j-1);
        %     end
        % end

        % for i=1:lx+1
        %     for j=1:nx
        %         matriz_z_trans(j,i) = matriz_z(i,j);
        %     end
        % end

        % disp(matriz_z_trans);

        % matriz_x = matriz_z*matriz_z_trans;
        % vetor_y = y*matriz_z_trans;


        %tentar implementar depois, não faz muito sentido

        matriz_x = zeros(nx+1, nx+1);

        for i=1:nx+1
            soma_y = 0; %é atualizado uma vez por linha
            for j=1:nx+1
                soma_x = 0; %é atualizado em a cada elemnto
                if i == 1
                    if j == 1
                        soma_x = lx;
                        for k=1:lx
                            soma_y = soma_y + y(k);
                        end
                    else
                        for k=1:lx
                            soma_x = soma_x + x(k, j-1);
                        end
                    end
                else
                    if j == 1
                        for k=1:lx
                            soma_x = soma_x + x(k, i-1);
                            soma_y = soma_y + y(k);
                        end
                    else if j == i
                        for k = 1:lx
                            soma_x = soma_x + (x(k, i-1)^2);
                        end
                    else
                        for k = 1:lx
                            soma_x = soma_x + (x(k,i-1) * x(k,j-1));
                        end
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