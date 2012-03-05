function [a b] = getdecisionbound (mu1, mu2, sigma, pc1, pc2)
%% Calculates the parameters for a linear decision boundary equation from the
%% results of a linear discriminant analysis on a set with two classes in two dimensional space.
%% 
%% mu1 - the mean of the first class data points
%% mu2 - the mean of the second class data points
%% sigma - the common sigma
%%
%% Returns the parameters of a linear function x2(x1)=a*x1+b


%% All calculations result from equaling the two discrimination functions and rearranging the result
%% into a function x2(x1).
isigma=inv(sigma);

b=-0.5*(mu1'*isigma*mu1)+log(pc1)+0.5*(mu2'*isigma*mu2)-log(pc2);
a=mu1(1)*isigma(1,1)+mu1(2)*isigma(1,2)-mu2(1)*isigma(1,1)-mu2(2)*isigma(1,2);
divisor=mu1(1)*isigma(2,1)+mu1(2)*isigma(2,2)-mu2(1)*isigma(2,1)-mu2(2)*isigma(2,2);

b=b/(-divisor);
a=a/(-divisor);

endfunction
