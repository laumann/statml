%% Performs LDA on the KnollC data, applies the results to both the training and
%% the test data, plots the results and prints the error percentages for both sets.

Ctrain=loadknoll('knollC-train.dt');
Ctest=loadknoll('knollC-test.dt');


[mu1C mu2C sigmaC pcC1 pcC2] = lda(Ctrain)

[mC bC]=getdecisionbound(mu1C, mu2C, sigmaC, pcC1, pcC2);

plotdecisionbound(Ctrain, mu1C, mu2C, mC, bC, -.1, .1, -2, 2);
title('Knoll C Training');
print -color ldaKnollCtrain.eps;
errTrain=ldaerror(mC, bC, Ctrain);

plotdecisionbound(Ctest, mu1C, mu2C, mC, bC, -.1, .1, -2, 2);
title('Knoll C Test');
print -color ldaKnollCtest.eps;
errTest=ldaerror(mC, bC, Ctest);

printf('Knoll C: Error for training set: %f, for test set: %f \n', errTrain, errTest);



