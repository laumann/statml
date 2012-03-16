%% simple exmple session for nn batch training

Ws = initWs(4);
allowed = initAllowed(Ws);
acts = initActs(4, act);
tr = multiBatchTrain(Ws, tdata, acts, actd, allowed, 0.001, 50);
tr2 = multiBatchTrain(Ws, tdata, acts, actd, allowed, 0.001, 500);
 
nnerror(Ws, tdata, acts)
nnerror(tr, tdata, acts)
nnerror(tr2, tdata, acts)
 