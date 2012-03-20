clear
%% NN
%% This file trains our NN models.
%%
%% Note that it doesn't plot or train models with shortcuts, but we
%% have trained and plotted models (included in the report) using
%% shortcuts as well. To do this, just replace the
%% 'initWsRandNoShort' with either 'initWsRand' or simply
%% 'initWs'. These three functions all initialise the weights
%% matrix in different ways, the first using random weights and no
%% shortcuts, the second using random weights + shortcuts and
%% lastly initialising all weights (including shortcuts) to 1.

%% Load the training data
load Data/sincTrain50.dt
load Data/sincTest50.dt

h = 20;
h2 = 2;

%% Activation functions 'act' and its derivative 'actd'
act = @(u) u/(1 + abs(u));
actd = @(u) 1/(1 + abs(u))^2;

Ws = initWsRandNoShort(h);
Ws20LR3 = Ws;
Ws2LR3 = initWsRandNoShort(h2);

allowed = initAllowed(Ws20LR3);
allowed2 = initAllowed(Ws2LR3);
acts = initActs(h, act);
acts2 = initActs(h2, act);


WsCells = {};
for j = 1:4
    WsCells{1, j} = Ws;
    WsCells{2, j} = Ws2LR3;
end
allowc = {allowed allowed2};
actc = {acts acts2};
LRs = [0.001 0.0001 0.00001 0.000001];

err = 1;
LR = 0.0005;

mods = findMods(allowed);
mods2 = findMods(allowed2);

modc = {mods mods2};

steps = 500; % Number of learning epochs
runs = 50;   % Number of iterations of batch training per epoch

ErrVecTrain = {};
ErrVecTest = {};
for i = 1:2
    ErrVecTrain = [ErrVecTrain;{[] [] [] []}];
    ErrVecTest = [ErrVecTest;{[] [] [] []}];
end

%% Training
for i = 1:steps
    for k = 1:2
        for l = 1:4
            WsCells{k, l} = multiBatchTrain(WsCells{k, l}, sincTrain50, ...
                                            actc{k}, actd, allowc{k}, ...
                                            LRs(l), runs);
            ErrVecTrain{k,l} = [ErrVecTrain{k, l}; Er(WsCells{k, l}, sincTrain50, actc{k})];
            ErrVecTest{k,l} = [ErrVecTest{k, l}; Er(WsCells{k, l}, sincTest50, actc{k})];
        end
    end
 
    %%accPartDerivs = accPds(Ws, sincTrain50(1,:), acts, actd, allowed);

    
    %%    numEstTest = estimatePds(Ws, eps, sincTest50, acts, mods);
    %%diff = abs(accPartDerivs - numEstTest);
    %%errTest = mean(diff(mods));
    
    %%numEst = estimatePds(Ws, eps, sincTrain50(1,:), acts, mods);
    %%diff = (abs(accPartDerivs - numEst));
    %%err = mean(diff(mods));
    errTest20LR4 = ErrVecTest{1, 2};
    errTest2LR4 = ErrVecTest{2, 2};
 
    sprintf(['i: %d; E 20 LR 10^-4: %f; E 2 LR 10^-4: %f; ' ...
    '%s'], i ,errTest20LR4(i),errTest2LR4(i),datestr(now()))
    %Ws = modWs(Ws, LR, accPartDerivs);
end


%% Our range for plotting
r = -10:.05:10;

%% Anonymous functions for extracting the result
getres = @(az) az(length(az), 2);
nnmodel = @(x) getres(runNN(Ws, x, acts));

colors = ['g', 'b', 'c', 'm'];


%% Plotting: NN model of 20 hidden neurons w/o shortcuts
plot(r, sin(r)./r, '-r'); hold on;
for i = 1:4
    nnmodel = @(x) getres(runNN(WsCells{1, i}, x, acts));
    plot(r, arrayfun(nnmodel, r), sprintf('-%c', colors(i)));
end
plot(sincTrain50(:, 1), sincTrain50(:, 2), 'bx');
legend('sin(x)/x', 'LR=0.001', 'LR=0.0001', 'LR=0.00001', ...
       'LR=0.000001', 'training data');
title('NN with 20 neurons in hidden layer / no shortcut')

print -dpsc 'solution20ns.eps'
hold off;
close;


%% Plotting: NN model of 2 hidden neurons w/o shortcuts
plot(r, sin(r)./r, '-r'); hold on;
for i = 1:4
    nnmodel = @(x) getres(runNN(WsCells{2, i}, x, acts2));
    plot(r, arrayfun(nnmodel, r), sprintf('-%c', colors(i)));
end
plot(sincTrain50(:, 1), sincTrain50(:, 2), 'bx');
legend('sin(x)/x', 'LR=0.001', 'LR=0.0001', 'LR=0.00001', ...
       'LR=0.000001', 'training data');
title('NN with 2 neurons in hidden layer / no shortcut')

print -dpsc 'solution2ns.eps'
hold off;
close;


%% Plotting: Error trajectories for NN model of 20 hidden neurons
%% w/o shortcuts
for i = 2:3    
    semilogy(1:steps, ErrVecTrain{1, i}, sprintf('-%c', colors(i-1)));
    hold on;
    semilogy(1:steps, ErrVecTest{1, i}, sprintf('-%c', colors(i+1)));
end
legend('Error to training data, LR=0.0001', ...
'Error to test data, LR=0.0001',...
'Error to training data, LR=0.00001',...
'Error to test data, LR=0.00001');
title('Error rates of 20 hidden layer neurons NN / no shortcut');
print -dpsc 'errors20ns.eps'
hold off;
close;


%% Plotting: Error trajectories for NN model of 2 hidden neurons
%% w/o shortcuts
for i = 2:3    
    semilogy(1:steps, ErrVecTrain{2, i}, sprintf('-%c', colors(i-1)));
    hold on;
    semilogy(1:steps, ErrVecTest{2, i}, sprintf('-%c', colors(i+1)));
end
legend('Error to training data, LR=0.0001', ...
'Error to test data, LR=0.0001',...
'Error to training data, LR=0.00001',...
'Error to test data, LR=0.00001');
title('Error rates of 2 hidden layer neurons NN / no shortcut');
print -dpsc 'errors2ns.eps'
hold off;
close;

