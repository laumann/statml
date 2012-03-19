clear


load Data/sincTrain50.dt
load Data/sincTest50.dt
h = 20;
act = @(u) u/(1 + abs(u));
actd = @(u) 1/(1 + abs(u))^2;
% hidden_units = [2 5 10 20];

% for h = hidden_units
%     h
% end

eps = 0.0001;

Ws = initWsRand(h);
allowed = initAllowed(Ws);
acts = initActs(h, act);
err = 1;
LR = 0.001;

mods = findMods(allowed);

%%Ws = multiBatchTrain(Ws, sincTrain50, acts, actd, allowed, LR,
%%500);
i = 0;
runs = 500;
while eps < err
    Ws = multiBatchTrain(Ws, sincTrain50, acts, actd, allowed, LR, ...
                        runs);
    i = i + 1;
    accPartDerivs = accPds(Ws, sincTrain50, acts, actd, allowed);
    Ws = modWs(Ws, LR, accPartDerivs);
    
    numEstTest = estimatePds(Ws, eps, sincTest50, acts, mods);
    diff = abs(accPartDerivs - numEstTest);
    errTest = mean(diff(mods));
    
    numEst = estimatePds(Ws, eps, sincTrain50, acts, mods);
    diff = (abs(accPartDerivs - numEst));
    err = mean(diff(mods));
    [i runs err errTest]
end


%% Use runNN to predict the entire range
%% nnrange = @(r) arrayfun(runNN(Ws, in acts), r)

getres = @(az) az(length(az), 2);
nnmodel = @(x) getres(runNN(Ws, x, acts));

r = -10:.05:10;
%semilogy(r, sin(r)./r); hold on
%semilogy(r, arrayfun(nnmodel, r), 'xr');

%print -dpsc 'semilognn.eps'

