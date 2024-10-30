function [FeatureMatrix] = prepare_for_regression(InitialMatrix)

  [m, n] = size(InitialMatrix);
  
  for i = 1:m
    k = 1;
    for j = 1:n
      if strcmp(char(InitialMatrix(i, j)), "yes")
        FeatureMatrix(i, k) = 1;
      elseif strcmp(char(InitialMatrix(i, j)), "no")
        FeatureMatrix(i, k) = 0;
      elseif strcmp(char(InitialMatrix(i, j)), "semi-furnished")
        FeatureMatrix(i, k) = 1;
        FeatureMatrix(i, k + 1) = 0;
        k++;
      elseif strcmp(char(InitialMatrix(i, j)), "unfurnished")
        FeatureMatrix(i, k) = 0;
        FeatureMatrix(i, k + 1) = 1;
        k++;
      elseif strcmp(char(InitialMatrix(i, j)), "furnished")
        FeatureMatrix(i, k) = 0;
        FeatureMatrix(i, k + 1) = 0;
        k++;
      else
        FeatureMatrix(i, k) = cellfun(@(x) str2double(x), InitialMatrix(i, j));
      endif
      k++;
    endfor
  endfor

  endfunction