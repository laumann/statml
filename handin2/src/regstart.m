%% Do the random split in the test data, and save to .mat file

if exist('regstart.mat')
    load regstart;
else
    %% size(train) = 200
    %% size(test)  = 52
    [train, test] = readbodyfat;
    save regstart.mat
end
