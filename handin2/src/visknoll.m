
%% Read files knoll-train{A,B,C}.dt and plot as 2D plots.

[dataA classA] = loadknoll('knollA-train.dt');
knollplot(dataA, classA, 'knollAtrain.eps')

[dataB classB] = loadknoll('knollB-train.dt');
knollplot(dataB, classB, 'knollBtrain.eps')

[dataC classC] = loadknoll('knollB-train.dt');
knollplot(dataC, classC, 'knollCtrain.eps')

