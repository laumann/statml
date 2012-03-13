function [W As Z] = forwardpropagation(input, M, act)
%% For a neural network, calculate the forward propagation of

%% W - the matrix of weights, in which w_{i,j} means the weight
%% from j to i, e.g. i <- j. W(i,j) => j < i
%%
%% W is strictly upper triangular (because there's no edge from i
%% to j when i >= j

%% Design of W:
%% First row - W(1,:) - are bias parameters.
%% let d = size(input,1) (number of rows/input neurons) are on
%% W(2,:) to W(2+d,:).
%% Then we have M hidden neurons on W(2+d+1,:) to W(2+d+M+1,:) and
%% the one output neuron is on W(2+d+M+2)

%% act - the activation function to use.

    %% Note: this matrix is not valid, because the hidden neurons
    %% are connected to one another.
    W = triu(rand(size(input,1) + M + 3), 1)
    %%disp(sprintf('Size will be: %d + %d + %d', size(input,1), M, 3))

    As = [];
    Z = [ 1 ; input ]; % Vector of computed outputs

    for i = size(input,1)+1:size(W)
        a = 0;
        for j = 1:i-1
            %% disp(sprintf('W(%d,%d)*Z(%d) = %d*%d = %d', j,i,j,W(j,i),Z(j), ...
            %%              Z(j)*W(j,i)));
            %% Opt.: Check if W(j,i) is zero.
            a = a + Z(j)*W(j,i);
        end
        As = [As; a];
        Z = [Z; act(a)];
    end

