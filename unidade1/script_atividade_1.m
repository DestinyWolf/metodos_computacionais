x = [2, 2, 0, -3, -2, -1, 0, 0, 2];
y = [0, 1, 3, 1, 0, -2, 0, -2, 2];


for i = 1:9
    [radius, theta] = coord2radius(x(i), y(i));
    fprintf("x =\t %d\t y =\t %d\t raio =\t %.2f\t theta = %.2f\n", x(i), y(i), radius, theta);
endfor

