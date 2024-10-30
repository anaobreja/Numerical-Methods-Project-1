function [Link] = get_link_matrix(Labyrinth)

   [m, n] = size(Labyrinth);

   size = m * n + 2;

   for i = 1 : m
     for j = 1 : n
       sum = 0;
       if bitand(Labyrinth(i, j), 2 ^ 3) == 0
         sum++;
         if i == 1
           Link((i-1) * n + j, size - 1) = 1;
         else
           Link((i-1) * n + j, (i - 2) * n + j) = 1;
         endif
       endif

       if bitand(Labyrinth(i, j), 2 ^ 2) == 0
         sum++;
         if i == m
           Link((i-1) * n + j, size - 1) = 1;
         else
           Link((i-1) * n + j, i * n + j) = 1;
         endif
       endif

       if bitand(Labyrinth(i, j), 2 ^ 1) == 0
         sum++;
         if j == n
          Link((i-1) * n + j, size) = 1;
         else
          Link((i-1) * n + j, (i-1) * n + j + 1) = 1;
         endif
       endif

       if bitand(Labyrinth(i, j), 2 ^ 0) == 0
         sum++;
         if j == 1
            Link((i-1) * n + j, size) = 1;
         else
           Link((i-1) * n + j, (i-1) * n + j - 1) = 1;
         endif
       endif

         Link((i-1) * n + j, :) /= sum;
     endfor
   endfor
   Link(size - 1, size - 1) = 1;
   Link(size, size) = 1;
   Link = sparse(Link)
endfunction
