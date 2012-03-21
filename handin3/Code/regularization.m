

data = loadknoll('knollC-train200.dt');

[C gamma] = modelselect(data);

model = train(data, C, gamma)
modelLarger = train(data, C*100, gamma)
modelSmaller = train(data, C/100, gamma)

[f b] = dividesupportvectors(C, model.SVs, model.sv_coef);
[fl bl] = dividesupportvectors(C*100, modelLarger.SVs, modelLarger.sv_coef);
[fs bs] = dividesupportvectors(C/100, modelSmaller.SVs, ...
                               modelSmaller.sv_coef);

disp(sprintf('Original: #SVs: %d\t#free SVs: %d\t#bounded SVs: %d', ...
     length(model.SVs), length(f), length(b)));
disp(sprintf('C*100:    #SVs: %d\t#free SVs: %d\t#bounded SVs: %d', ...
     length(modelLarger.SVs), length(fl), length(bl)));
disp(sprintf('C/100:    #SVs: %d\t#free SVs: %d\t#bounded SVs: %d', ...
     length(modelSmaller.SVs), length(fs), length(bs)));
