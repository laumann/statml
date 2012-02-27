function d = dmetr(x, z)
  M = [100 0; 0 1];
  d = norm(M*x - M*z);