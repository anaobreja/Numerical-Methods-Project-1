function [Adj] = get_adjacency_matrix(Labyrinth)

   [m, n] = size(Labyrinth);

   size = m * n + 2;

   for i = 1 : m
     for j = 1 : n
       if bitand(Labyrinth(i, j), 2 ^ 3) == 0
         if i == 1
           Adj((i-1) * n + j, size - 1) = 1;
         else
           Adj((i-1) * n + j, (i - 2) * n + j) = 1;
         endif
       endif

       if bitand(Labyrinth(i, j), 2 ^ 2) == 0
         if i == m
           Adj((i-1) * n + j, size - 1) = 1;
         else
           Adj((i-1) * n + j, i * n + j) = 1;
         endif
       endif

       if bitand(Labyrinth(i, j), 2 ^ 1) == 0
         if j == n
          Adj((i-1) * n + j, size) = 1;
         else
          Adj((i-1) * n + j, (i-1) * n + j + 1) = 1;
         endif
       endif

       if bitand(Labyrinth(i, j), 2 ^ 0) == 0
         if j == 1
            Adj((i-1) * n + j, size) = 1;
         else
           Adj((i-1) * n + j, (i-1) * n + j - 1) = 1;
         endif
       endif
     endfor
   endfor
   Adj(size - 1, size - 1) = 1;
   Adj(size, size) = 1;

   Adj = sparse(Adj);
  endfunction
