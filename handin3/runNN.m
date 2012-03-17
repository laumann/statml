function az = runNN(Ws, in, acts)
%% runs a NN
%%
%% Arguments:
%%  Ws: weights
%%  in: input value
%%  acts: activation functions for all neurons (use initAllowed)
%%
%% Result:
%%  az = Matrix of As and Zs. Result of output neuron is in
%%   az(length(az), 2)
    
    Zs = [1;in;zeros(size(Ws, 1)-2, 1)];
    As = [1;in;zeros(size(Ws, 1)-2, 1)];
    for i = idx(2):size(Ws, 1)
        act = acts{i};
        x = (Ws(i, idx(0):i-1))'.*Zs(idx(0):i-1);
        As(i) = sum(x);
        Zs(i) = act(As(i));
    end
    az = [As Zs];