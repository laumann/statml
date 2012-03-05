%% Performs LDA on the KnollA data, applies the results to both the training and
%% the test data, plots the results and prints the error percentages for both sets.

Atrain=loadknoll('knollA-train.dt');
Atest=loadknoll('knollA-test.dt');


[mu1A mu2A sigmaA pcA1 pcA2] = lda(Atrain)

[mA bA]=getdecisionbound(mu1A, mu2A, sigmaA, pcA1, pcA2);

plotdecisionbound(Atrain, mu1A, mu2A, mA, bA, -2, 2, -2, 2);
title('Knoll A Training');
print -color ldaKnollAtrain.eps;
errTrain=ldaerror(mA, bA, Atrain);

plotdecisionbound(Atest, mu1A, mu2A, mA, bA, -2, 2, -2, 2);
title('Knoll A Test');
print -color ldaKnollAtest.eps;
errTest=ldaerror(mA, bA, Atest);

printf('Knoll A: Error for training set: %f, for test set: %f \n', errTrain, errTest);



