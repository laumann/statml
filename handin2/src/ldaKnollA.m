%% Performs LDA on the KnollA data, applies the results to both the training and
%% the test data, plots the results and prints the error percentages for both sets.

Atrain=loadknoll('knollA-train.dt');
Atest=loadknoll('knollA-test.dt');


[mu1A mu2A sigmaA pcA1 pcA2] = lda(Atrain)

[mA bA]=getdecisionbound(mu1A, mu2A, sigmaA, pcA1, pcA2);

plotdecisionbound(Atrain, mu1A, mu2A, mA, bA, -2.5, 2.5, -2, 2);
title('Knoll A Training');
print -dpsc ldaKnollAtrain.eps;
[errTrain margTrain]=ldaerror(mu1A, mu2A, sigmaA, pcA1, pcA2, Atrain);

plotdecisionbound(Atest, mu1A, mu2A, mA, bA, -2.5, 2.5, -2, 2);
title('Knoll A Test');
print -dpsc ldaKnollAtest.eps;
[errTest margTest]=ldaerror(mu1A, mu2A, sigmaA, pcA1, pcA2, Atest);

disp(sprintf('Knoll A: Error for training set: %f, for test set: %f', errTrain, errTest));
disp(sprintf('Knoll A: Margin for training set: %f, for test set: %f', margTrain, margTest)); 




