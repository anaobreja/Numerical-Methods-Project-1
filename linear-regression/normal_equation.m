function [Theta] = normal_equation(FeatureMatrix, Y, tol, iter)
  % FeatureMatriTheta -> the matriTheta with all training eThetaamples
  % Y -> the vector with all actual values
  % tol -> the learning rate
  % iter -> the number of iterations
  % tol -> the tolerance level for convergence of the conjugate gradient method

  % Theta -> the vector of weights
    A = FeatureMatrix' * FeatureMatrix;
    b = FeatureMatrix' * Y;
    [m n] = size(A);
    
    for i = 1 : m
      if det(A(1 : i, 1 : i)) <= 0
        Theta = zeros(n + 1, 1);
        return;
      endif
    endfor
    
    x = zeros(n, 1);
    
    r = b;
    v = r;
    tolsquared = tol^2;
    k = 1;
    
    while k <= iter && r' * r > tolsquared
        tk = (r' * r) / (v' * A * v);
        x += tk * v;
        r_old = r;
        r = r - tk * A * v;
        sk = (r' * r) / (r_old' * r_old);
        v = r + sk * v;
        k = k + 1;
    end
    
    Theta = x;
    Theta1 = zeros(n + 1, 1);
    Theta1(2:end, 1) = Theta(1:end, 1);
    Theta = Theta1;
    
    
endfunction