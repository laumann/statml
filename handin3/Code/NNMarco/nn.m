function [z a] = nn(w, layers, inputs)
layernos=cumsum(layers);

%% set z0 to 1
%% z must be treated as zero-based
z=ones(1, size(w,2));
a=zeros(1, size(w,2));

%% input equals output for input neurons
for i=1:layers(1)
   z(i+1)=inputs(i);
end

%% for each hidden and output neuron
%% i is the neuron number
for i=(layernos(1)+1):size(w,1)
    sum=0;
    first=1;
    %% find first neuron of this layer
    for j=2:length(layernos)
        if i<=layernos(j)
            first=layernos(j-1)+1;
        end
    end
    
    %% iterate over all input neurons
    
    for j=0:(first-1)
       sum=sum+z(j+1)*w(i, j+1);
    end
    
    a(i+1)=sum;
    
    %% for output neurons, output is linear, otherwise use the function.
    if (i<=layernos(length(layernos)-1))
        z(i+1)=sum/(1+abs(sum));
    else
        z(i+1)=sum;
    end
end


end