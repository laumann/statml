clear
%%% Part 1: Regression
%%% This file contains the programmatic answers for questions 1.1
%%% and 1.2. They are both included here because they depend on the
%%% same data, the design matrices, etc.
%%%
%%% The first part of the file sets up all the variables, by
%%% constructing a target vector, a test vector (same as target,
%%% just for the test), the design matrices for both selections and
%%% an anonymous RMS function.
%%%
%%% The design matrices are constructed from the following columns
%%% (selection 2 just contains the values from column 8):
%%%
%%% Column 4 = weight
%%% Column 7 = chest
%%% Column 8 = abdomen 2
%%% Column 9 = hip

%%% The setup

%% Load the train and test sets
regstart;

N = size(train,1);
T = size(test, 1);

%% Column 2 is the target variable t
target      = train(:,2);
test_target =  test(:,2);

%% Anonymous root mean square function. 
RMS = @(params, testset) sqrt(sum((test_target - testset*params).^2)/T);

%% Selection 1
design1 = [ ones(N,1) train(:,4) train(:,7) train(:,8) train(:,9) ];
test1   = [ ones(T,1)  test(:,4)  test(:,7)  test(:,8)  test(:,9) ];

%% Selection 2
design2 = [ ones(N,1) train(:,8) ];
test2   = [ ones(T,1)  test(:,8) ];



%%% 1.1 Maximum Likelihood solution

%% Calculate the parameters w_ML, where pinv gives us the
%% pseudo-inverse of design1.
params1 = pinv(design1)*target

RMS_ML1 = RMS(params1, test1)


%% Calculate the parameters
params2 = pinv(design2)*target

RMS_ML2 = RMS(params2, test2)



%%% 1.2 Maximum a posteriori solution
%%% We make use of function mapestimate, to give us the estimates
%%% when given a design matrix, target vector, alpha and
%%% (optionally) beta.

%%% For each selection we plot the RMS of the MAP solution along
%%% with the RMS of the ML solution (the latter as a straight line).

%% AFTERNOTE: After some playing around, it's found that alphas =
%% -0.1:.001:.02 for Selection 1 give the best results and for
%% Selection 2, use the range -1:.001:.1

%% Our range of operation (alphas)
alphas = -0.1:.001:.02;

%% Selection 1
RMS_MAP1 = @(alpha) RMS(mapestimate(design1, target, alpha), test1);

min_RMS_MAP1 = min(arrayfun(RMS_MAP1, alphas))

plot(alphas, arrayfun(RMS_MAP1, alphas), '-b'); hold on
plot(alphas, arrayfun(@(x) RMS_ML1, alphas), '-r')
xlabel('$\alpha$', 'interpreter', 'latex')
ylabel('$\mathrm{RMS}$', 'interpreter', 'latex')
legend('$\mathrm{RMS}_\mathrm{MAP}$','$\mathrm{RMS}_\mathrm{ML}$')
h = legend;
set(h, 'interpreter', 'latex');
axis tight
hold off

print -dpsc 'mapsel1.eps'


%% Q:For what values of the prior precision (alpha) does the
%% RMS error go below the RMS of the ML solution?
%% A: Compute the RMS - RMS_ML1
%%
%% The following gives the values of alpha versus the difference of
%% the RMS's, values below zero mean that the MAP RMS is less than
%% ML RMS.
%%
%% [ alphas; arrayfun(RMS_MAP1, alphas) - RMS_ML1 ]'


%% Selection 2
alphas = -1:.001:.1;

RMS_MAP2 = @(alpha) RMS(mapestimate(design2,target,alpha), test2);

min_RMS_MAP2 = min(arrayfun(RMS_MAP2, alphas))

plot(alphas, arrayfun(RMS_MAP2, alphas), 'b'); hold on
plot(alphas, arrayfun(@(x) RMS_ML2, alphas), 'r')
xlabel('$\alpha$', 'interpreter', 'latex')
ylabel('$\mathrm{RMS}$', 'interpreter', 'latex')
legend('$\mathrm{RMS}_\mathrm{MAP}$','$\mathrm{RMS}_\mathrm{ML}$')
h = legend;
set(h, 'interpreter', 'latex');
axis tight
hold off

print -dpsc 'mapsel2.eps'

%% [ alphas; arrayfun(RMS_MAP2, alphas) - RMS_ML2 ]'
