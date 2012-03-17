function Wsn1 = modWs(Wsn, Lrate, pd)
%%
%% modifies weights
%%
%% Arguments:
%%  Wsn: old weights, book: w^{t}
%%  Lrate: learning rate, book: \eta
%%  pd: partial derivative, book: E(w^{t})
%%
%% Result:
%%  Wsn1 = new weights, book: w^{t+1}
    
    Wsn1 = Wsn - (Lrate * pd);
