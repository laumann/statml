function deltas = nntrain(input, target, W, act, actd)
%% Given the matrix W of weight and an input, perform forward and
%% backward propagation and return the computed deltas. Use act as
%% activation function.
%%
%% Parameters:
%% input - (column) vector of inputs to consider

%% The design of W is as follows:
%%     |     hidden neurons   |
%%   1   2    3    4    5  ...   M
%% 1   w_02 w_03 w_04 w_05 ... w_0M    bias parameters
%% 2   w_12 w_13 w_14 w_15 ... w_1M    first layer
%% 3                           w_2M
%% 4                           w_4M
%% 5                           w_5M
%% .                           ...
%% M-1                         w_(M-1)M
%% M                           
%%                              ^
%%                      The last column (w_0M ... w(M-1)M)^T is the
%%                      weights from the hidden layer to the output
%%                      neuron.
%%
%% All the unspecified entries in W are zero.

    As = [] %% Vector of activations
    Z = [1; input ] %% Vector of computed outputs
    for i = 2:size(W,1)
        a = 0;
        %% Calculate activation for hidden neuron i
        for j = 1:size(Z)
            disp(sprintf('W(%d,%d)*Z(%d) = %d*%d = %d', j,i,j,W(j,i),Z(j), ...
                         Z(j)*W(j,i)));
            a = a + Z(j)*W(j,i);
        end
        As = [As; a]
        Z = [Z; act(a)]
    end

    %% Error
    As(size(As,1))
    deltas = [zeros(size(W-2),1); abs(target - As(size(As,1)))]
    
    %% For each hidden neuron, compute the delta
    for i = size(W,1)-1:-1:2
        for j = i+1:size(W,1)
            deltas(i) = deltas(i) + deltas(j)*W(j,i)
        end
        deltas(i) = actd(As(i-1))*deltas(i)
    end


