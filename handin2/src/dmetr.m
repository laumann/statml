function d = dmetr(x, z)
%% dmetr - calculate metric as given in 3.2
%% 
%% x - first value (also called x in assignment)
%% z - second value (also called z in assignment)
%%
%% d = distance between x and z

  M = [100 0; 0 1];
  d = norm(M*x - M*z);