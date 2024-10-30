function [Labyrinth] = parse_labyrinth(file_path)

  fid = fopen(file_path,"r");

  m = fscanf(fid, "%f",1);
  n = fscanf(fid,"%f", 1);

  for i = 1 : m
    for j = 1 : n
      Labyrinth(i, j) = fscanf(fid,"%f", 1);
    endfor
  endfor
  fclose(fid);
 end
