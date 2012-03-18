%% Load all data sets

knollC100=loadknoll('knollC-train100.dt');
knollC200=loadknoll('knollC-train200.dt');
knollC400=loadknoll('knollC-train400.dt');
knollCtest=loadknoll('knollC-test.dt');

%% Perform model selection on each one of them
%% Results will be printed
%% We do NOT use normalisation


disp('Model selection for knollC-train100');
[c100 gamma100] = modelselect(knollC100)

disp('Model selection for knollC-train200');
[c200 gamma200] = modelselect(knollC200)

disp('Model selection for knollC-train400');
[c400 gamma400] = modelselect(knollC400)

%% We now train our SVM on each dataset using the respective values
%% we found for C and gamma.

c100model=train(knollC100(:,1:2), knollC100(:,3), c100, gamma100);

c200model=train(knollC200(:,1:2), knollC200(:,3), c200, gamma200);

c400model=train(knollC400(:,1:2), knollC400(:,3), c400, gamma400);

%% And run all instances on themselves (and the others?) and the test data

%% TODO



%% Visualizing the SVM solution

%% We want to plot the original knollC-train200 data

[class1 class2] = dividedataset(knollC200);

hold off;
plot(class1(:, 1), class1(:, 2), 'rx');
hold on;
plot(class2(:, 1), class2(:, 2), 'bx');

%% Get the free and bounded support vectors
[free bounded] = dividesupportvectors(c200, c200model.SVs, c200model.sv_coef);

%% And plot them: bounded SVs in green, free ones in black
plot(bounded(:,1), bounded(:,2), 'go');
plot(free(:,1), free(:,2), 'ko');

print -dpsc freeBoundedSVs.eps;
