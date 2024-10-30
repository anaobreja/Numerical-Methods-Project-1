function [Error] = lasso_regression_cost_function(Theta, Y, FeatureMatrix, lambda)
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
    sum += (Y(i) - (Theta(1) + FeatureMatrix(i, :) * Theta(2 : end))) ^ 2; 
  endfor
  
  sum_t = 0;
  for i = 1 : n
    sum_t += abs(Theta(i));
  endfor
  
  Error = 1 / m * sum + lambda * sum_t;
  
endfunction