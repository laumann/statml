function apds = accPds(Ws, tdata, acts, actD, allow)
    
    ins = tdata(:,1);
    targets = tdata(:,2);
        
    apds = allow * 0;
    
    for i = 1 : length(ins)
        az = runNN(Ws, ins(i), acts);
        As = az(:,1);
        Zs = az(:,2);
        
        deltas = findDeltas(Ws, actD, targets(i), Zs(length(Zs)), ...
                            As);
        
        pds = partderivs(deltas, Zs, allow);
        apds = apds + pds;
    end
    %%    accPds