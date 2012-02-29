
%% Shortcut anonymous function
euclid = @(x,y) eudist(x,y);
Ks = [1 3 5 7 9];

%% knollA
trainA = loadknoll('knollA-train.dt');
testA  = loadknoll('knollA-test.dt');

knntestrun(trainA, testA, euclid, Ks)

%% knollB
trainB = loadknoll('knollB-train.dt');
testB  = loadknoll('knollB-test.dt');

knntestrun(trainB, testB, euclid, Ks)

%% knollC
trainC = loadknoll('knollC-train.dt');
testC  = loadknoll('knollC-test.dt');

knntestrun(trainC, testC, euclid, Ks)