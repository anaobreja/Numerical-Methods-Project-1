function path = heuristic_greedy(start_position, probabilities, adjacency_matrix)
  size = length(adjacency_matrix);

  path = [start_position];

  visited = zeros(1, size);
  visited(start_position) = 1;
  
 
  while ~isempty(path)
    position = path(end);
    if position == size - 1
      return
    endif

    i = 1;
    for(j = 1 : size)
      if adjacency_matrix(position, j) == 1 && visited(j) == 0
        unvisited_neighbours(i) = j;
        i++;
      endif
      endfor

    if isempty(unvisited_neighbours)
      path(end) = path(end - 1);
    else
      n = length(unvisited_neighbours);
      max = 0;
      for i = 1:n
        if probabilities(unvisited_neighbours(i)) > max
          max = probabilities(unvisited_neighbours(i));
          id_max = i;
        endif
      endfor
      next_pos = unvisited_neighbours(id_max);
      visited(next_pos) = 1;
      path = [path, next_pos];
    endif
  endwhile
endfunction
