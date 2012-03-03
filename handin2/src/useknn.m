
%% Shortcut anonymous function
euclid = @(x,y) eudist(x,y);
Ks = [1 3 5 7 9];

%% knollA
disp('Performing k-NN on knollA');
disp('=========================');
trainA = loadknoll('knollA-train.dt');
testA  = loadknoll('knollA-test.dt');

disp('Training Set')
knntestrun(trainA, testA, euclid, Ks)
disp('Test set')
knntestrun(trainA, trainA, euclid, [3 5 7 9])


%% knollB
disp('Performing k-NN on knollB');
disp('=========================');
trainB = loadknoll('knollB-train.dt');
testB  = loadknoll('knollB-test.dt');

disp('Training Set')
knntestrun(trainB, testB, euclid, Ks)
disp('Test set')
knntestrun(trainB, trainB, euclid, [3 5 7 9])


%% knollC
disp('Performing k-NN on knollC');
disp('=========================');
trainC = loadknoll('knollC-train.dt');
testC  = loadknoll('knollC-test.dt');

disp('Training Set')
knntestrun(trainC, testC, euclid, Ks)
disp('Test set')
knntestrun(trainC, trainC, euclid, [3 5 7 9])



%% Using d-metric on knollC
disp('Performing k-NN on knollC using d-metric');
disp('========================================');
knntestrun(trainC, testC, @(x,y) dmetr(x,y), Ks)
knntestrun(trainC, testC, @(x,y) dmetr(x,y), [3 5 7 9])