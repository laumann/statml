function [ correctperct ] = crossval( n, data, labels, c, gamma )
%% Performs n-fold cross validation on the training data for certain values
%% of C and gamma for a Gaussian kernel.
%% We use libsvms internal method. 
    commandstring = sprintf('-s 0 -t 2 -g %d -c %d -v %d -q', gamma, c, n);
    correctperct = svmtrain(labels, data, commandstring);

end

