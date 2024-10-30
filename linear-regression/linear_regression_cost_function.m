function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples

  % Error -> the error of the regularized cost function

  m = length(FeatureMatrix);
  
  sum = 0;
  for i = 1: m
    sum += (Theta(1) + FeatureMatrix(i, :) * Theta(2 : end) - Y(i)) ^ 2; 
  endfor
  
  Error = 1 / (2 * m) * sum;
endfunction