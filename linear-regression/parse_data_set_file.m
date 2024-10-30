function [Y, InitialMatrix] = parse_data_set_file(file_path)
  fid = fopen(file_path, 'r');

    line = fgetl(fid);
    split = strsplit(line, ' ');

    array = cellfun(@(x) str2double(x), split);
    m = array(1, 1);
    n = array(1, 2);

    for i = 1:m
      line = fgetl(fid);
      split = strsplit(line, ' ');
      Y(i, 1) = str2double(split(1, 1));
      split1 = split(2:end);
      InitialMatrix(i, :) = split1;
    endfor

  fclose(fid)

endfunction