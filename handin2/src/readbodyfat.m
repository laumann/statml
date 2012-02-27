function [train, test] = readbodyfat
% [train, test] = readbodyfat
%
%  Reads the body fat data set from the bodyfat.mat file and returns 
%  appropriate training and test sets.

load bodyfat
ridx = randperm(size(data,1));
test = data(ridx(201:end),:);
train = data(ridx(1:200),:);

end

