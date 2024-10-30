function [Y, InitialMatrix] = parse_csv_file(file_path)

    fid = fopen(file_path, 'r');

     
    line = fgetl(fid);
    split = strsplit(line, ',');
    
    i = 1;
    while 1
      line = fgetl(fid);
      if (line == -1)
        break;
      endif
      split = strsplit(line, ',');
      Y(i, 1) = str2double(split(1, 1));
      split1 = split(2:end);
      InitialMatrix(i, :) = split1;
      i++;
    endwhile
   
  fclose(fid)
 
  endfunction