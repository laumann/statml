function t = knntest(train, test, distfunc, k)
    errors = 0;
    for i = 1:size(test, 1)
        cl = knn(train, test(i, 1:2)', distfunc, k);
        errors = errors + (cl ~= test(i, 3));
    end
    t = errors/size(test, 1);
