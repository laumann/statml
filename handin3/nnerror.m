function error = nnerror(Ws, tdata, acts)
    
    %% simple (too simple?) function to test current NN
        
    err = [];
    for i = 1:length(tdata)
        result = runNN(Ws, tdata(i, 1), acts);
        e = result(size(result, 1), 2) - tdata(i, 2);
        err = [err; e];
    end
    err;
    error = mean(err);
    