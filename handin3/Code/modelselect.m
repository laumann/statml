function [C gamma] = modelselect(knolldata, normal)
%% Model Selection
%% For the given data set, we try a number of different values for c and
%% gamma, perform 5-fold cross validation on each combination of those
%% values and print the results. 
%% If requested, normalizes the data before doing the
%% cross-validation.

    
    if nargin < 2
        normal = 0;
    end

    %% Structure of the data is always the same...
    labels = knolldata(:, 3);
    data = knolldata(:, 1:2);
    
    if normal
        data = normalize(data);
    end
    
    Cs = [0.1, 1, 10, 100, 1000, 10000];
    gammas = [0.0001, 0.001, 0.01, 0.1, 1, 10, 100];

    maxp = 0;
    for c = Cs
       for g = gammas
           fprintf('C: %d, gamma: %f ', c, g);
           p = crossval(5, data, labels, c, g);
           if maxp < p
               C = c;
               gamma = g;
               maxp = p;
           end
       end
    end
