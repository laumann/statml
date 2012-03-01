function x = knntestrun(train, test, distfunc, Ks)
%% knntest - run series of K-NN tests using one test set and different Ks,
%%   print out results
%%
%% train - training set, a Nx3 Matrix [xval yval class]
%% test - test set, a Nx3 Matrix [xval yval realclass]
%% distfunc - the function as metric
%% Ks - Nx1 matrix of different Ks for K-NN
%%
%% x = index of the first k with minimal error rate

    %% minErr := [error-rate index-of-Ks]
    minErr = [2 -1];
    for k = Ks
        err = knntest(train, test, distfunc, k);
        disp(sprintf('%d-Nearest Neighbor error rate: %f', k, err));
        if (err < minErr(1)) 
            minErr = [err k];
        end
    end
    x = minErr(2);
