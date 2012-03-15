function [ model ] = train( data, labels, c, gamma )
%% Trains the SVM on the given data using the given parameters.
%% Returns libsvm model data which can then be used with svmpredict.
    commandstring = sprintf('-s 0 -t 2 -g %d -c %d -q', gamma, c);
    model = svmtrain(labels, data, commandstring);

end