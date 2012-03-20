function Ws = initWsRandNoShort(hidden)
%% hidden: # of neurons in hidden layer
%%  
%% Ws = initial weight matrix
%%  indices are shifted because of MATLABs one-indexing
%%  (index 0 is used for bias)
%%  use idx()-function for correct indexing

    size = hidden + 3; %% three because: 1 input, 1 output, 1 bias-input
    Ws = zeros(size);
    
    %% connect bias and input to hidden layer
    
    for i = 2:hidden+1
        Ws(idx(i), idx(0)) = 1;
        Ws(idx(i), idx(1)) = rand();
    end
    
    %% connect bias to output
    Ws(idx(hidden+2), idx(0)) = 1;
    
    %% connect hidden layer to output
    for i = 2:hidden+1
        Ws(idx(hidden+2), idx(i)) = rand();
    end
