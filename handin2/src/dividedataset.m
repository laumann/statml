function [class1 class2] = dividedataset (A)
%% Divides a given set of two dimensional classification data into one set for each class.
%% The classes must be encoded by being 1 for the first class and different from one for the second.
%% 
%% A - the input data set
    class1=ones(0,2);
    class2=ones(0,2);
    for i=1:length(A)
        if A(i,3)==1
            class1=[class1;A(i,1),A(i,2)];
        else
            class2=[class2;A(i,1),A(i,2)];
        endif
    end
endfunction
