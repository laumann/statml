function allow = initAllowed(originalWs)
%% defines, which weights are allowed to be modified
%% requires originalWs to feature modifiable weights as non-zeros (ASSUMPTION!)
%%
%% Arguments:
%%  originalWs: original weights. only non-zero values of this
%%   matrix are considered "modifiable"
%%
%% Result:
%%  allow = matrix of 1/0, which can be used to "null out"
%%  forbidden modifications of a given weight
    
    %% the following function returns 1 on non-zero values
    fn = @(u) abs(sign(u));
    
    %% apply it on every value of x
    allow = arrayfun(fn, originalWs);
    