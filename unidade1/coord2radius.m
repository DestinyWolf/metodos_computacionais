function [radius, theta] = coord2radius(x, y)
    radius = sqrt(x^2 + y^2);

    if x < 0
        if y < 0
            theta = rad2deg(atan(y/x) - pi);

        elseif y > 0
            theta = rad2deg(atan(y/x) + pi);
        else
            theta = rad2deg(pi);
        endif
    elseif x == 0
        if y < 0
            theta = rad2deg(-pi/2);
        elseif y > 0
            theta = rad2deg(pi/2);
        else
            theta = rad2deg(0);
        endif
    else
        theta = rad2deg(atan(y/x));
    endif
endfunction
