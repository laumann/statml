function epds = estimatePds(Ws, eps, tdata, acts, chgs)
    size = length(Ws);
    Z = zeros(size, size);
    epds = Z;
    ErTheta = Er(Ws, tdata, acts);
    
    for i = chgs
        Wepse = Ws;
        Wepse(i) = Wepse(i) + eps;
        epds(i) = (Er(Wepse, tdata, acts) - ErTheta)/eps;        
    end
    