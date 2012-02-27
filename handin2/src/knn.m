function y = knn(data, input, distfunc, k)

  d = [];

  for i=1:size(data, 1)
    d(i, 1:2) = [distfunc(data(i, 1:2)', input) data(i, 3)];
  end
    
  d = sortrows(d, [1, 2]);
  d = d(1:k, 2);
  
  # qnd for binary -1/1:
  d = sum(d);
  #d = d/abs(d);
  if (d == 0)
    d = sign(randn)
  end
  y = sign(d);
