function M = MassAssembler(x)
% Computes the mass matrix on mesh x. See Larson and Bengzon
    n = length(x)-1; % number of subintervals
    M = zeros(n+1,n+1); % allocate mass matrix
    for i = 1:n 
        h = x(i+1) - x(i); 
        M(i,i) = M(i,i) + h/3; 
        M(i,i+1) = M(i,i+1) + h/6;
        M(i+1,i) = M(i+1,i) + h/6;
        M(i+1,i+1) = M(i+1,i+1) + h/3;
    end
    M = M(2:end-1, 2:end-1);   % Remove the boundary entries.
    end