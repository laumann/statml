function result = ldadiscrimination (x, mu, sigma, pK)
%% Implements a discrimination function for linear discriminant analysis.
%% It is called with the respective parameters for different classes for each data point.
%% The point is then assigned to the class with the highest result

    isigma=inv(sigma);
    result = x'*isigma*mu-0.5*mu'*isigma*mu+log(pK);

endfunction
