clear

%% Load the train and test sets
regstart;

N = size(train,1);
T = size(test, 1);

%% Column 2 is the target variable t
target      = train(:,2);
test_target =  test(:,2);


%% Selection 1 consists of:
%% Column 4 = weight
%% Column 7 = chest
%% Column 8 = abdomen 2
%% Column 9 = hip
design1 = [ ones(N,1) train(:,4) train(:,7) train(:,8) train(:,9) ];
test1   = [ ones(T,1)  test(:,4)  test(:,7)  test(:,8)  test(:,9) ];

%% Calculate the parameters w_ML, where pinv gives us the
%% pseudo-inverse of design1.
params1 = pinv(design1)*target

RMS_1 = sqrt(sum((test_target - test1*params1).^2)/T)

%% Sel ection 2 consists of:
%% Column 8 = abdomen 2
design2 = [ ones(N,1) train(:,8) ];
test2   = [ ones(T,1)  test(:,8) ];

%% Calculate the parameters
params2 = pinv(design2)*target

RMS_2 = sqrt(sum((test_target - test2*params2).^2)/T)



%% Plotting section
% plot(target, [ train(:,4) train(:,7) train(:,8) train(:,9) ], 'x')
% hold on
% plot(test_target, test1, 'o')
