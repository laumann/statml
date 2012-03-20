function [ classvector ] = classify( data, model, labels )
%% Trains the SVM on the given data using the given parameters.
%% Returns libsvm model data which can then be used with svmpredict.
    if nargin < 3
        % create dummy labels
        labels = ones(size(data, 1), 1);
    end

    classvector = svmpredict(labels, data, model, '');

end
