function [data class] = loadknoll(file)
%% Load KNOLL from data file and return the data as a 100x2 matrix
%% with double values and the its corresponding class in a column
%% vector of size 100 with integer entries.

    fid = fopen(file);
    k = textscan(fid, '%n %n %d', 'Headerlines', 1);
    fclose(fid);
    
    data = [ k{1} k{2} ];
    class = k{3};
    