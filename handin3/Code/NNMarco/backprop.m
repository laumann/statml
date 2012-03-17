function [delta der] = backprop (w, z, a, targety, layers)
layersum=cumsum(layers);

%delta=zeros(1, layersum(length(layersum))-layersum(1));
delta=zeros(1, layersum(length(layersum)));

der=zeros(size(w));

%for i=layersum(length(layersum)):-1:(layersum(1)+1)
for i=layersum(length(layersum)):-1:1
    %% if it is an output neuron
    if (i>layersum(length(layersum)-1))
       %delta(i-layersum(1)) = z(i+1)-targety(i-layersum(length(layersum)-1));
       delta(i) = z(i+1)-targety(i-layersum(length(layersum)-1));
    else
        ai=a(i+1);
        ha=1/((1+abs(ai))^2);
        
        sum=0;
        for k=i+1:layersum(length(layersum))
            sum=sum+delta(k)*w(k,i+1);
        end
        
        delta(i) = ha * sum;
    end
end

%% compute the partial derivatives

for i=1:1:layersum(length(layersum))
    
%     if i<layersum(1)+1
%         for j=0:1:layersum(length(layersum))
%             der(i,j+1)=delta(i-layersum(1)) * z(j+1); 
%         end
%     else
        for j=0:1:layersum(length(layersum))
            der(i,j+1)=delta(i) * z(j+1); 
        end
%    end
end


end