function d = findDeltas(Ws, actD, target, out, As)
%%
%% finds deltas in backpropagation
%%
%% Arguments:
%%  Ws: weights
%%  actD: derivative of activation function for hidden layer
%%  target: target value
%%  out: output value of NN
%%  As: vector of a_{i}
%%
%% Result:
%%  d = vector of deltas. idx(0) and idx(1) will be 0
%%
    lastIdx = size(Ws, 1)
    d = [zeros(lastIdx - 1, 1); out-target];
    
    
    %% find deltas only for hidden layer
    for i = (lastIdx -1) : -1 : idx(2) 
        i
        x = Ws(i+1:lastIdx, i) .* d(i+1:lastIdx)
        d(i) = actD(As(i)) * sum(x)
    end
    