function [mean1 mean2 sigma pc1 pc2] = lda(A)
%% Performs linear discriminant analysis on input data for two different classes.
%% 
%% A - a Nx3 matrix containing corresponding values for x1, x2 and the assigned class
%% The classes must be encoded by being 1 for the first class and different from one for the second.
%%
%% Returns the two means and the common sigma for the resulting gaussian distrubution as well as
%% the general probability that any point, regardless of its coordinates, falls into a category.

    %divide the data set into two parts for simplicity
    [first second]=dividedataset(A);

    %% get the mean for both classes
    mean1=mean(first)
    mean2=mean(second)

    %get the common sigma
    firstsum=[0,0;0,0];
    secondsum=[0,0;0,0];

    for i=1:length(first)
        difference=mean1-first(i,:);
        product=difference'*difference;
        firstsum=firstsum+product;
    end

    for i=1:length(second)
        difference=mean2-second(i,:);
        product=difference'*difference;
        secondsum=secondsum+product;
    end

    sigma=(firstsum+secondsum)/(length(A)-2)
    mean1=mean1';
    mean2=mean2';

    %calculate Pr(Y=C_k) for both classes
    pc1=length(first)/length(A);
    pc2=length(second)/length(A);

