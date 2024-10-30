function [G, c] = get_Jacobi_parameters(Link)
  size = length(Link)
  disp(Link)
  G = Link(1: size - 2, 1 : size - 2);
  c = Link(1 : size - 2 , size - 1);
endfunction
