function [X_train, y_train, X_test, y_test] = split_dataset(X, y, percent)
  % X -> the loaded dataset with all training examples
  % y -> the corresponding labels
  % percent -> fraction of training examples to be put in training dataset
  
  % X_[train|test] -> the datasets for training and test respectively
  % y_[train|test] -> the corresponding labels
  
  % Example: [X, y] has 1000 training examples with labels and percent = 0.85
  %           -> X_train will have 850 examples
  %           -> X_test will have the other 150 examples

  % Amestecarea datelor
     % Get the number of examples in the dataset
    m = size(X, 1);

    % Shuffle the examples randomly
    perm = randperm(m);
    X_shuffled = X(perm, :);
    y_shuffled = y(perm);

    % Calculate the number of examples to include in the training set
    m_train = floor(percent/100 * m);

    % Split the dataset into training and test sets
    x_train = X_shuffled(1:m_train, :);
    y_train = y_shuffled(1:m_train);
    X_test = X_shuffled(m_train+1:end, :);
    y_test = y_shuffled(m_train+1:end);
endfunction
