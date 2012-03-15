function modelselect (knolldata)
%% Model Selection
%% For the given data set, we try a number of different values for c and
%% gamma, perform 5-fold cross validation on each combination of those
%% values and print the results.

    c=[0.1, 1, 10, 100, 1000, 10000];
    gamma=[0.001, 0.01, 0.1, 1, 10, 100, 1000];

    labels=knolldata(:, 3);
    data=normalize(knolldata(:, 1:2));

    for i=1:length(c)
       for j=1:length(gamma)
           result=crossval(5, data, labels, c(i), gamma(j));
           fprintf('C: %d, gamma: %d. Average correct percentage in 5-fold cross validation: %d \n', c(i), gamma(j), result);
       end
    end

    end