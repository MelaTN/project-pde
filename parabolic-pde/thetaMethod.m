function xi_next = thetaMethod(xi,dt,theta,M,K)
% Computes the numerical solution at the next time step given the numerical solution at the
% current time step. 
    xi_next = (M + theta*dt*K) \ ((M - (1-theta)*dt*K) * xi);
end