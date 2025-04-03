function [result] = raiz(a)

   old_x = 1;
   is_complex = false;
   count = 1;

   if a ~= 0
       if a < 0
           is_complex = true;
           a = abs(a);
       endif

       new_x = (old_x + a/old_x)/2;
       error = abs((new_x - old_x)/new_x);
       interacao(1) = count;

       if is_complex
           x_values(1) = new_x*i;
       else
           x_values(1) = new_x;
       endif


       while (new_x ^ 2 ~= a && error >= 1.0000e-04)
            old_x = new_x;
            new_x = (old_x + a/old_x)/2;
            error = abs((new_x - old_x)/new_x);
            count += 1;
            if is_complex
                x_values(count) = old_x*i;
            else
                x_values(count) = old_x;
            endif

            interacao(count) = count;
       endwhile

       if is_complex
            result = new_x*i;
            plot(interacao, imag(x_values));
       else
           result = new_x;
           plot(interacao, x_values);
       endif

           xlabel('Interacao');
           ylabel('Raiz');
   else
      result = 0;
      plot(0,0)
      xlabel('Interacao');
      ylabel('Raiz');
   endif


endfunction
