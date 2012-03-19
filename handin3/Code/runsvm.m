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

c100model=train(knollC100, c100, gamma100);

c200model=train(knollC200, c200, gamma200);

c400model=train(knollC400, c400, gamma400);

%% And run all instances on themselves (and the others?) and the test data

getpct=@(a,b) sum(a==b)/size(a,1);
disp('Running the model for knollC-train100 on all data sets.');
fprintf('knollC-train100: %d %% \n', getpct(knollC100(:,3), classify(knollC100(:, 1:2), c100model)));
fprintf('knollC-train200: %d %% \n', getpct(knollC200(:,3), classify(knollC200(:, 1:2), c100model)));
fprintf('knollC-train400: %d %% \n', getpct(knollC400(:,3), classify(knollC400(:, 1:2), c100model)));
fprintf('knollC-test: %d %% \n', getpct(knollCtest(:,3), classify(knollCtest(:, 1:2), c100model)));

disp('Running the model for knollC-train200 on all data sets.');
fprintf('knollC-train100: %d %% \n', getpct(knollC100(:,3), classify(knollC100(:, 1:2), c200model)));
fprintf('knollC-train200: %d %% \n', getpct(knollC200(:,3), classify(knollC200(:, 1:2), c200model)));
fprintf('knollC-train400: %d %% \n', getpct(knollC400(:,3), classify(knollC400(:, 1:2), c200model)));
fprintf('knollC-test: %d %% \n', getpct(knollCtest(:,3), classify(knollCtest(:, 1:2), c200model)));

disp('Running the model for knollC-train400 on all data sets.');
fprintf('knollC-train100: %d %% \n', getpct(knollC100(:,3), classify(knollC100(:, 1:2), c400model)));
fprintf('knollC-train200: %d %% \n', getpct(knollC200(:,3), classify(knollC200(:, 1:2), c400model)));
fprintf('knollC-train400: %d %% \n', getpct(knollC400(:,3), classify(knollC400(:, 1:2), c400model)));
fprintf('knollC-test: %d %% \n', getpct(knollCtest(:,3), classify(knollCtest(:, 1:2), c400model)));



%% Get number of free and bounded support vectors
[free100 bounded100] = dividesupportvectors(c100, c100model.SVs, c100model.sv_coef);
[free200 bounded200] = dividesupportvectors(c200, c200model.SVs, c200model.sv_coef);
[free400 bounded400] = dividesupportvectors(c400, c400model.SVs, c400model.sv_coef);

disp(sprintf('knollC100: Free SVs: %d Bounded SVs: %d', length(free100), length(bounded100)));
disp(sprintf('knollC200: Free SVs: %d Bounded SVs: %d', length(free200), length(bounded200)));
disp(sprintf('knollC400: Free SVs: %d Bounded SVs: %d', length(free400), length(bounded400)));

%% Visualizing the SVM solution

%% We want to plot the original knollC-train200 data

[class1 class2] = dividedataset(knollC200);

hold off;
plot(class1(:, 1), class1(:, 2), 'rx');
hold on;
plot(class2(:, 1), class2(:, 2), 'bx');

%% Plot SVs: bounded SVs as squares, free ones as circles
plot(bounded200(:,1), bounded200(:,2), 'ks');
plot(free200(:,1), free200(:,2), 'ko');
legend('Class 1','Class 2','Bounded Support Vectors','Free Support Vectors');
xlabel('x1');
ylabel('x2');

print -dpsc freeBoundedSVs.eps;
