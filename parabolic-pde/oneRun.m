function [sol,EL2, EV] = oneRun(theta,h,dt,T)
    x = 0:h:1; % mesh
    xin = x(2:end-1)'; % Interior nodes
    nsteps = round(T/dt); % Number of time steps
    
    M = MassAssembler(x);
    A = StiffnessAssembler(x);
    K = (1/pi^2)*A - 3*M;
    
    sol = zeros(length(x),nsteps+1);
    sol(2:end-1,1) = sin(2*pi*xin);
    
    EL2  = 0; % running max of the L2 error
    eVss = 0; % running sum of the square of the V-norm
    
    for i=2:nsteps+1
        sol(2:end-1,i) = thetaMethod(sol(2:end-1,i-1), dt, theta, M, K);
        [eL2,eV] = errorNorms(x, sol(:,i), (i-1)*dt); % The L2 norm and V norm of the error at the current iteration
        EL2  = max(EL2, eL2);
        eVss = eVss+ eV^2;
    end
    
    EV = sqrt(dt*eVss);
end