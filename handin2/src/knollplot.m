function knollplot(data, outfile)
%% Visualise KNOLL data, given a corresponding class vector and
%% output the graph to the given file name.
%%
%% Sorts the data into two matrices depending on the class
%% (positive or negative) and plots positive in green and negative
%% in red.

    % pos = [];
    % neg = [];
    % for i = 1:size(data,1)
    %     if data(i,3) > 0
    %         pos = [pos; data(i,1:2)];
    %     else
    %         neg = [neg; data(i,1:2)];
    %     end
    % end
    [pos neg] = dividedataset(data);

    plot(pos(:,1), pos(:,2), 'og'); hold on
    plot(neg(:,1), pos(:,2), 'or'); hold off

    print('-dpsc', outfile)