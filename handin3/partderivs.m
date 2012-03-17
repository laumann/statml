function pd = partderivs(d, Zs, allowed)
    dim = length(d);
    pd = zeros(dim, dim);
    for k = idx(1): dim
        for j = idx(0) : dim - 1
            pd(k, j) = d(k) * Zs(j);
        end
    end
    
    pd = pd .* allowed;
    
    %% should be the same as:
    %% pd = d*Zs'
    %% pd = pd .* allowed
