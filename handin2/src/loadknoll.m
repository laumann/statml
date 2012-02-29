function data = loadknoll(file)
%% Load KNOLL from data file and return the data as a 100x2 matrix
%% with double values and the its corresponding class in a column
%% vector of size 100 with integer entries.

%% The reason for returning two matrices instead of one, is because
%% MATLAB is seriously limited in terms of mixing data types in a
%% matrix (it cannot). The class vector is of types int32 and our
%% data is double.

    fid = fopen(file);
    data = cell2mat(textscan(fid, '%n %n %n', 'Headerlines', 1));
    fclose(fid);

    