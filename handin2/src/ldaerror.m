function quotient = ldaerror(m, b, A)
%% Compute LDA error 
errors=0;
    
for i=1:length(A)
    x1=A(i,1);
    x2=m*x1+b;

    if(A(i,2)<x2)
        class = 1;
    else
        class = -1;
    end
        
    errors = errors + (class ~= A(i,3));
        
end

quotient = errors/length(A);



