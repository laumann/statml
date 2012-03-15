function [ scaleddata ] = normalize( data )
%% Rescales the data to be within the interval [0:1] for all values.
%% We use the method recommended in the FAQ of LIBSVM

	scaleddata=(data - repmat(min(data,[],1),size(data,1),1))*spdiags(1./(max(data,[],1)-min(data,[],1))',0,size(data,2),size(data,2));

end

