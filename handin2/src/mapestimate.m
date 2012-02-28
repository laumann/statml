function [mapmean mapcov] = mapestimate(design, target, alpha, beta)
%% Obtain the MAP estimate of mean and covariance given the
%% input parameters

    if nargin < 4
        beta = 1;
    end

    %% Covariance given by eq. 3.54
    mapcov = inv(alpha*eye(size(design,2)) + beta*design'*design);

    %% The mean is given by eq. 3.53
    mapmean = beta*mapcov*design'*target;
