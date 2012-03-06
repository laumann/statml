function knollplot(data, outfile)
%% Visualise KNOLL data, given a corresponding class vector and
%% output the graph to the given file name.
%%
%% Sorts the data into two matrices depending on the class
%% (positive or negative) and plots positive in green and negative
%% in red.

    [pos neg] = dividedataset(data);

    plot(pos(:,1), pos(:,2), 'og'); hold on
    plot(neg(:,1), pos(:,2), 'or'); hold off

    if nargin > 1
        print('-dpsc', outfile)
    end
