data=load('sincTrain50.dt');
%data=data(1:40,:);

layers=[1,30,1];

%w=randn(32, 33);
%w=ones(22,23)*0.02
%w=initw;

%initw2=w;
%initw3=w;

deriv=zeros(size(w));

error=1000;
for tmp=1:8000
lasterror=error;
error=0;

w=w-(deriv*0.00018);

deriv=zeros(size(w));
for i=1:size(data, 1)
    [z a] = nn(w, layers, data(i,1));
    [delta der] = backprop(w, z, a, data(i, 2), layers);
    deriv=deriv+der;
    
    error=error+ (z(length(z))-data(i,2))^2;
end
if isnan(error)
    disp('Something bad happened.')
   break; 
end
disp(error);

end

result=zeros(0,2);

for i=1:size(data, 1)
    [z a] = nn(w, layers, data(i,1));
    fprintf('mine: %f orig: %f \n', z(length(z)), data(i,2));
    result=[result; data(i,1), z(length(z))];
end

hold off;
plot(result(:,1), result(:,2), 'rx');
hold on;
plot(data(:,1), data(:,2), 'gx');
print -dpsc train.eps
    
