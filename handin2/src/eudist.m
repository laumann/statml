function d = eudist(v1, v2)
%% eudist - calculate euclidean distance
%%
%% v1, v2 - inputs
%%
%% d = euclidean distance between v1 and v2

    m = v1 - v2;
    m = m.^2;
    m = sum(m);

    %% possible optimization: 
    %% - omit sqrt. 
    %% consequence:
    %% - results are higher, but still comparable
    %% - faster
    m = sqrt(m); 

    d = m;
