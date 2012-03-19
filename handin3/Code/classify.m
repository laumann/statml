function [ classvector ] = classify( data, model )
%% Trains the SVM on the given data using the given parameters.
%% Returns libsvm model data which can then be used with svmpredict.
    dummylabels = ones(size(data, 1), 1);

    classvector = svmpredict(dummylabels, data, model, '');

end