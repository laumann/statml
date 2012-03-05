%% Performs LDA on the KnollC data, applies the results to both the training and
%% the test data, plots the results and prints the error percentages for both sets.

Ctrain=loadknoll('knollC-train.dt');
Ctest=loadknoll('knollC-test.dt');


[mu1C mu2C sigmaC pcC1 pcC2] = lda(Ctrain)

[mC bC]=getdecisionbound(mu1C, mu2C, sigmaC, pcC1, pcC2);

plotdecisionbound(Ctrain, mu1C, mu2C, mC, bC, -.1, .1, -2, 2);
title('Knoll C Training');
print -dpsc ldaKnollCtrain.eps;
[errTrain margTrain]=ldaerror(mu1C, mu2C, sigmaC, pcC1, pcC2, Ctrain);

plotdecisionbound(Ctest, mu1C, mu2C, mC, bC, -.1, .1, -2, 2);
title('Knoll C Test');
print -dpsc ldaKnollCtest.eps;
[errTest margTest]=ldaerror(mu1C, mu2C, sigmaC, pcC1, pcC2, Ctest);

disp(sprintf('Knoll C: Error for training set: %f, for test set: %f', errTrain, errTest));
disp(sprintf('Knoll C: Margin for training set: %f, for test set: %f', margTrain, margTest));




