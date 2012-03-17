function epds = estimatePds(Ws, eps, tdata, acts)
    size = length(Ws);
    Z = zeros(size, size);
    epds = Z;
    ErTheta = Er(Ws, tdata, acts);
    for i = 1:size
        for j = 1:size
            epse = Z;
            epse(i, j) = eps;
            epds(i, j) = (Er(Ws+epse, tdata, acts) - ErTheta)/eps;
        end
    end
    