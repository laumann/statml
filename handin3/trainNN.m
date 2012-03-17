function trained = trainNN(hidden, tdata, act, actD, Lrate)
    trained = initWs(hidden);
    allow = initAllowed(Ws);
    acts = initActs(hidden, act);

    
    
    %% todo: run until error is small enough?
    %% 
    trained = batchTrain(trained, tdata, acts, actD, allow, ...
                             Lrate);
    
    %%