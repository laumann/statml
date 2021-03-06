function [ model ] = train(knolldata, c, gamma )
%% Trains the SVM on the given data using the given parameters.
%% Returns libsvm model data which can then be used with svmpredict.
    commandstring = sprintf('-s 0 -t 2 -g %d -c %d', gamma, c);
    model = svmtrain(knolldata(:,3), knolldata(:,1:2), commandstring);

end