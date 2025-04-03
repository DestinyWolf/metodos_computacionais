function y = p3(x)
    y = 1.25 - ((1/(4 * pi * 8.9e-12)) .* ((4.000e-10 .* x)./(sqrt((x.^2 + 0.85.^2)))));
endfunction