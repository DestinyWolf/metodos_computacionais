function a = regressao_linear(x, y)
    [_, nx] = size(x);
    [_, ny] = size(y);

    if nx != ny
        disp("os vetores precisam ter tamanho compativel");
    else
        xx = x(:);
        yy = y(:);

        sm_x = 0;
        sm_y = 0;
        sm_x_2 = 0;
        sm_xy = 0;
        media_x = 0;
        media_y = 0;

        for i=1:nx
            sm_x = sm_x + xx(i);
            sm_y = sm_y + yy(i);
            sm_x_2 = sm_x_2 + (xx(i)^2);
            sm_xy = sm_xy + (xx(i) * yy(i));
            media_x = media_x + xx(i)/nx;
            media_y = media_y + yy(i)/ny;
        end

        a(1) = ((nx*sm_xy) - (sm_x*sm_y))/((nx*sm_x_2) - (sm_x)^2);
        a(2) = media_y - a(1)*media_x;

        st = 0;
        sr = 0;

        for i=1:nx
            st = st + ((yy(i)-media_y)^2);
            sr = sr + ((yy(i) - a(2) - a(1)*xx(i))^2);
        end

        sy = sqrt((st/(nx-1)));
        syx = sqrt((sr/(nx-2)));
        r_2 = (st-sr)/st;

        fprintf("St: %f\tSr: %f\tSy: %f\tSy/x: %f\tr²: %f", st, sr, sy, syx, r_2);
    end
end