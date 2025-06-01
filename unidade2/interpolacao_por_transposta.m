function [y_interpolado, coeficientes] = interpolacao_por_transposta(x, x_desejado, y)

    [_, nx] = size(x);
    [_, ny] = size(y);

    if nx ~= ny
    error('vetores x e y devem ter o mesmo número de linhas');
    else
        % Criação da matriz de transposta
        for i=1:nx
            for j=1:nx
                matriz_z(i,j) = (x(1,i))^(j-1);
            end
        end
        %Matriz de vandermount transposta

        for i=1:nx
            for j=1:nx
                matriz_z_trans(j,i) = matriz_z(i,j);
            end
        end

        %matriz_x = matriz_z*matriz_z_trans;
        %vetor_y = y*matriz_z_trans;

        

        coeficientes = gauss_jordan(matriz_z, y);
        disp("coeficientes");
        disp(coeficientes);

        y_interpolado =  0;

        [_, n] = size(coeficientes);
        for i=1:n
            y_interpolado = y_interpolado + coeficientes(1,i)*(x_desejado^(i-1));
        end
        
        disp("valor de y")
        disp(y_interpolado);

        xx = linspace(x(1), x(nx));

        [_, leng] = size(xx);
        for i=1:leng
            yy(i) = 0;
            for j=1:nx
                yy(i) = yy(i) + coeficientes(j)*(xx(i)^(j-1));
            end
        end

        plot(xx, yy, x_desejado, y_interpolado, 'ro');
        h = legend("show");
    end
end