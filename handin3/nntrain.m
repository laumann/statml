clear


load Data/sincTrain50.dt
h = 20;
act = @(u) u/(1 + abs(u));
actd = @(u) 1/(1 + abs(u))^2;
% hidden_units = [2 5 10 20];

% for h = hidden_units
%     h
% end

eps = 0.001

Ws = initWsRand(h);
allowed = initAllowed(Ws);
acts = initActs(h, act);
err = 1;
LR = 0.001

while eps < err
    accPartDerivs = accPds(Ws, sincTrain50, acts, actd, allowed);
    Ws = modWs(Ws, LR, accPartDerivs);
    numEst = estimatePds(Ws, eps, sincTrain50, acts);
    err = max(accPartDerivs - numEst);
    err
end


%% Use runNN to predict the entire range
%% nnrange = @(r) arrayfun(runNN(Ws, in acts), r)

getres = @(az) az(length(az), 2)
nnmodel = @(x) getres(runNN(Ws, x, acts))

r = -10:.05:10;
semilogy(r, sin(r)./r); hold on
semilogy(r, arrayfun(nnmodel, r), 'xr');

print -dpsc 'semilognn.eps'