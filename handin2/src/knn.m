function y = knn(data, input, distfunc, k)
%% k-NN classifier
%%
%% data - the 'training' data for the model, an Nx3 matrix.
%% input - the (single) point to classify. A 1x3 vector.
%% distfunc - the metric to use.
%% k - how many neighbours to inspect.


    d = [];

    for i = 1:size(data, 1)
        d(i, 1:2) = [distfunc(data(i, 1:2)', input) data(i, 3)];
    end
    
    d = sortrows(d, [1, 2]);
    d = d(1:k, 2);
    
    %% QnD for binary -1/1:
    d = sum(d);

    %% if undecided, use random decision
    if d == 0
        d = sign(randn)
    end

    y = sign(d);
