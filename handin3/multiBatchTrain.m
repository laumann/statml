function trained = multiBatchTrain(Ws, tdata, acts, actD, allow, Lrate, times)

    trained = Ws;
    for i = 1:times
        trained = batchTrain(trained, tdata, acts, actD, allow, Lrate);
    end