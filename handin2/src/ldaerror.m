function [quotient minmargin] = ldaerror(mu1, mu2, sigma, pK1, pK2, A)
%% Calculates the error percentate which results from classifying a data set 
%% with a linear discriminant analysis as well as the margin the LDA has for a given data set. 
%%
%% a and b - parameters of the decision boundary equation x2=a*x1+b
%% A - the data set to classify
    errors = 0;
    minmargin = intmax;
    isigma = inv(sigma);

    % iterate through all points
    for i=1:length(A)
        x=[A(i,1); A(i,2)];
        decision=ldadiscrimination(x, mu1, sigma, pK1)-ldadiscrimination(x, mu2, sigma, pK2);

        % classify the current point
        if decision > 0
            class=1;
        else
            class=-1;
        end

        % and add it to the error count if the classification was wrong
        errors = errors + (class ~= A(i,3));

        % calculate the current margin: multiply the hyperplane's value at the given point with its
        % actual class and divide by the length of w in the hyperplane equation.
        w=isigma*mu1-isigma*mu2;
        margin=A(i,3)*decision/sqrt(w(1)^2+w(2)^2);

        % this is the new minimum margin if it is smaller than the current one
        if margin < minmargin
            minmargin = margin;
        end
    end
    
    % calculate the error percentage
    quotient=errors/length(A);
