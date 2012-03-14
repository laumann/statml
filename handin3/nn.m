load Data/sincTrain50.dt

act = @(u) u/(1 + abs(u))
actd = @(u) 1/(1 + abs(u))^2

%% Construct a W
W = [zeros(M,1) [ones(1,M-2); rand(1,M-2); zeros(M-2,M-2)] [1; ...
                    rand(M-1,1)]]

nntrain(sincTrain50(1,1),sincTrain50(1,2), W, act)