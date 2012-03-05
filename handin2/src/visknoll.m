
%% Read files knoll{A,B,C}-train.dt and plot as 2D plots.

dataA = loadknoll('knollA-train.dt');
knollplot(dataA, 'knollAtrain.eps')

dataB = loadknoll('knollB-train.dt');
knollplot(dataB, 'knollBtrain.eps')

dataC = loadknoll('knollC-train.dt');
knollplot(dataC, 'knollCtrain.eps')

