function acts = initActs(hidden, func)
%% create cellarray with functions for neuron activation
%% all non-hidden neurons get the identity function
%%
%% Arguments:
%%  hidden: number of neurons in the hidden layer
%%  func: activation function for hidden neurons
%%
%% Result:
%%  acts = cellarray of size hidden+3 with function handles
%%   (access with acts{i})
    
    acts = {@id;@id};
    for i = 1:hidden
        acts = [acts;{func}];
    end
    acts = [acts;{@id}];
    