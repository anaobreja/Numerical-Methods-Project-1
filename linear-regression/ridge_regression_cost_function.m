function [Error] = ridge_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
  % Theta -> the vector of weights
  % Y -> the vector with all actual values
  % FeatureMatrix -> the matrix with all training examples
  % lambda -> regularization parameter that controls the amount of 
  %           shrinkage applied to the regression coefficients

  % Error -> the error of the regularized cost function

  m = length(FeatureMatrix);
  n = length(Theta);
  
  sum = 0;
  for i = 1: m
    sum += (Theta(1) + FeatureMatrix(i, :) * Theta(2 : end) - Y(i)) ^ 2; 
  endfor
  
  sum_t = 0;
  for i = 1 : n
    sum_t += Theta(i) ^ 2;
  endfor
  
  Error = 1 / (2 * m) * sum + lambda * sum_t;
endfunction