%% Performs LDA on the KnollB data, applies the results to both the training and
%% the test data, plots the results and prints the error percentages for both sets.

Btrain=loadknoll('knollB-train.dt');
Btest=loadknoll('knollB-test.dt');


[mu1B mu2B sigmaB pcB1 pcB2] = lda(Btrain)

[mB bB]=getdecisionbound(mu1B, mu2B, sigmaB, pcB1, pcB2);

plotdecisionbound(Btrain, mu1B, mu2B, mB, bB, -2, 2, -2, 2);
title('Knoll B Training');
print -dpsc ldaKnollBtrain.eps;
errTrain=ldaerror(mB, bB, Btrain);

plotdecisionbound(Btest, mu1B, mu2B, mB, bB, -2, 2, -2, 2);
title('Knoll B Test');
print -dpsc ldaKnollBtest.eps;
errTest=ldaerror(mB, bB, Btest);

disp(sprintf(['Knoll B: Error for training set: %f, for test set: ' ...
              '%f \n'], errTrain, errTest));



