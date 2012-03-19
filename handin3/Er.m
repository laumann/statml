function error = Er(Ws, tdata, acts)
%singleErrors = [];
    Esum = 0;
    for i = 1:length(tdata)
        az = runNN(Ws, tdata(i, 1), acts);
        result = az(length(Ws), 2);
        %singleErrors = [singleErrors;(result - tdata(i, 2))^2];
        Esum = Esum + (result - tdata(i, 2))^2;
    end
    %error = (1/2)*sum(singleErrors);
    error = Esum/2;
    