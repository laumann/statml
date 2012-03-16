function modelselect (knolldata, normal)
%% Model Selection
%% For the given data set, we try a number of different values for c and
%% gamma, perform 5-fold cross validation on each combination of those
%% values and print the results. 
%% If requested, normalizes the data before doing the cross-validation.
    
    if nargin<2
        normal=0;
    end
    
    dims=size(knolldata, 2);
    
    c=[0.1, 1, 10, 100, 1000, 10000];
    gamma=[0.0001, 0.001, 0.01, 0.1, 1, 10, 100];

    labels=knolldata(:, dims);
    
    data=knolldata(:, 1:(dims-1));
    
    if normal
        data=normalize(data);
    end
    
    for i=1:length(c)
       for j=1:length(gamma)
           fprintf('C: %d, gamma: %d.', c(i), gamma(j));
           crossval(5, data, labels, c(i), gamma(j));
           
       end
    end

    end