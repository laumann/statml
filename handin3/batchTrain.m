function trained = batchTrain(Ws, tdata, acts, actD, allow, Lrate)
    
%% comments tbd
    pds = accPds(Ws, tdata, acts, actD, allow)

    trained = modWs(Ws, Lrate, pds);
        