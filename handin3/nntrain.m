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

Ws = initWs(h);
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