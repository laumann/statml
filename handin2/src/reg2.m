clear

%% Anonymous root mean square function. 
RMS = @(test_target, params, testset, T)...
      sqrt(sum((test_target - testset*params).^2)/T);

%% Our range of alpha values
alphas = -5:.01:10;

if exist('estimates.mat')
    load estimates;
else
    RMSs_ML1 = [];
    RMSs_ML2 = [];

    RMSs_MAP1 = [];
    RMSs_MAP2 = [];
    
    for i = 1:100
        [train test] = readbodyfat;
        
        N = size(train,1);
        T = size(test, 1);
        
        %% Column 2 is the target variable t
        target      = train(:,2);
        test_target =  test(:,2);
        
        %% Selection 1
        design1 = [ ones(N,1) train(:,4) train(:,7) train(:,8) train(:,9) ];
        test1   = [ ones(T,1)  test(:,4)  test(:,7)  test(:,8)  test(:,9) ];
        
        %% Selection 2
        design2 = [ ones(N,1) train(:,8) ];
        test2   = [ ones(T,1)  test(:,8) ];
        
        RMSs_ML1 = [RMSs_ML1 RMS(test_target, pinv(design1)*target, test1, T)];
        RMSs_ML2 = [RMSs_ML2 RMS(test_target, pinv(design2)*target, test2, T)];

        %% Do the same for MAP.
        %% For MAP the result is not a single value, but an array
        %% of estimates based on the different values of alpha

        %% For each new split of the data, calculate mapestimate
        %% for the range of alphas (gives an array). Accumulate
        %% these and finally normalize

        %% Every row in RMSs_MAP1 is a root mean square error for a
        %% MAP estimate for a particular value of alpha
        RMSs_MAP1 = [RMSs_MAP1; arrayfun(@(alpha) ...
                                         RMS(test_target,...
                                             mapestimate(design1, target, alpha),...
                                             test1, T),...
                                         alphas)];

        RMSs_MAP2 = [RMSs_MAP2; arrayfun(@(alpha) ...
                                        RMS(test_target,...
                                            mapestimate(design2, target, alpha),...
                                            test2, T),...
                                        alphas)];

    end
    
    RMS_ML1 = mean(RMSs_ML1)
    RMS_ML2 = mean(RMSs_ML2)
    
    RMS_MAP1 = mean(RMSs_MAP1);
    RMS_MAP2 = mean(RMSs_MAP2);
    
    %% For now, don't save.
    %% save estimates.mat
end


%% Plot these beasts
plot(alphas, RMS_MAP1, '-b'); hold on
plot(alphas, arrayfun(@(x) RMS_ML1, alphas), '-r'); hold off

plot(alphas, RMS_MAP2, '-g'); hold on
plot(alphas, arrayfun(@(x) RMS_ML2, alphas), '-c');
