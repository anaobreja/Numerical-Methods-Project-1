function [decoded_path] = decode_path(path, lines, cols)
  values = 1: lines * cols;
  Labyrinth = reshape(values, lines, cols)';

  ok = 0;
  size = length(path);
  for i = 1 : size - 1
    if rem(path(i), cols) == 0
      c = cols;
      l = floor(path(i) / cols);
    else
      c = rem(path(i), cols);
      l = floor(path(i) / cols) + 1;
    endif

    if ok == 0
      decoded_path = [l, c]
    else
      decoded_path = vertcat(decoded_path, [l, c]);
    endif
    ok++;
  endfor
  endfunction
