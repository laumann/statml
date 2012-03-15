function [ classvector ] = classify( data, model )
%% Trains the SVM on the given data using the given parameters.
%% Returns libsvm model data which can then be used with svmpredict.
    dummylabels = ones(1, length(data));

    classvector = svmpredict(dummylabels, data, model, '');

end