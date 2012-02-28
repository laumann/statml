function knollplot(data, class, outfile)
%% Visualise KNOLL data, given a corresponding class vector and
%% output the graph to the given file name.
%%
%% Sorts the data into two matrices depending on the class
%% (positive or negative) and plots positive in green and negative
%% in red.

    pos = [];
    neg = [];
    for i = 1:size(data,1)
        if class(i) == 1
            pos = [pos; data(i,:)];
        else
            neg = [neg; data(i,:)];
        end
    end

    plot(pos(:,1), pos(:,2), 'og')
    hold on
    plot(neg(:,1), pos(:,2), 'or')
    hold off

    %%print -dpsc outfile