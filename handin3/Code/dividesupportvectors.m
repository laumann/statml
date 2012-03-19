function [free bounded] = dividesupportvectors (c, SVs, SVcoeffs)
%% Takes a matrix containing all support vectors of a trained C-SVM
%% and divides it into free and bounded support vectors.
    
    free=ones(0, size(SVs, 2));
    bounded=ones(0, size(SVs, 2));

    for i=1:length(SVcoeffs)
        current= SVs(i,:);
        if c==abs(SVcoeffs(i))
           bounded=[bounded; current];
        else
           free=[free; current]; 
        end
    end
    
end