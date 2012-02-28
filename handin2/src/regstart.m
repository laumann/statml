%% Do the random split in the test data, and save to .mat file

if exist('regstart.mat')
    load regstart;
else
    [train, test] = readbodyfat;
    save regstart.mat
end
