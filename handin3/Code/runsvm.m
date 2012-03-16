%% Load all data sets

knollC100=loadknoll('knollC-train100.dt');
knollC200=loadknoll('knollC-train200.dt');
knollC400=loadknoll('knollC-train400.dt');
knollCtest=loadknoll('knollC-test.dt');


%% Perform model selection on each one of them
%% Results will be printed
%% We do NOT use normalisation


disp('Model selection for knollC-train100 \n');
modelselect(knollC100);

disp('Model selection for knollC-train200 \n');
modelselect(knollC200);

disp('Model selection for knollC-train400 \n');
modelselect(knollC400);

%% We now train our SVM on each dataset using the respective values
%% we found for C and gamma.

c100=1000;
gamma100=0.01;

c100model=train(knollC100, c100, gamma100);

c200=1000;
gamma200=0.01;

c200model=train(knollC200, c200, gamma200);

c400=1000;
gamma400=0.01;

c400model=train(knollC400, c400, gamma400);

%% And run all instances on themselves (and the others?) and the test data

%% TODO



%% Visualizing the SVM solution

%% We want to plot the original knollC-train200 data

[class1 class2] = dividedataset (knollC200);

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


