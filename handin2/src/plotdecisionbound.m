function plotdecisionbound (A, muA, muB, a, b, xmin, xmax, ymin, ymax)
%% Plots the result of a linear discriminant analysis, i.e. the two data sets, their means 
%% and the resulting decision boundary.
%%
%% A - the original data set
%% muA - the mean of the first class data
%% muB - the mean of the second class data
%% a - a parameter of the decision boundary equation x2=a*x1+b
%% b - a parameter of the decision boundary equation x2=a*x1+b
%% ymin and ymax - min and max values of y (i.e. x2) to be displayed in the plot (allows to adjust zoom)

    if (nargin < 7)
        xmin=-2.5;
        xmax=2.5;
	ymin=-2;
        ymax=2;
    endif

    %divide data set into the two classes
    [first second]=dividedataset(A);

    %plot data points and means
    hold off;
    plot(first(:,1), first(:,2), 'rx');
    hold on;
    plot(muA(1), muB(2), 'r+', 'MarkerSize', 20);

    plot(second(:,1), second(:,2), 'bx');
    plot(muB(1), muB(2), 'b+', 'MarkerSize', 20);

    %and plot the decision boundary inbetween (hopefully)
    x1=[-2:.1:2];
    x2=a*x1+b;
    plot(x1,x2,'g');

    %adjust zoom and add legend
    axis([xmin,xmax,ymin,ymax]);
    xlabel('x1');
    ylabel('x2');
    
endfunction
