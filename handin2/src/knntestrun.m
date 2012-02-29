function x = knntestrun(train, test, distfunc, Ks)
  minErr = [2 -1];
  for k = Ks
    err = knntest(train, test, distfunc, k);
    sprintf('%d-Nearest Neighbor error rate: %f', k, err);
    if (err < minErr(1)) 
      minErr = [err k];
    end
  end
  x = minErr(2);
