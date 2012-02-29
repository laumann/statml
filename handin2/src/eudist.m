function d = eudist(v1, v2)
    m = v1 - v2;
    m = m.^2;
    m = sum(m);
    m = sqrt(m); % who cares. would be faster without
    d = m;
