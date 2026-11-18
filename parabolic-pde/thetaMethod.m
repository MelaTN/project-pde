function xi_next = thetaMethod(xi,dt,theta,M,K)
xi_next = (M + theta*dt*K) \ ((M - (1-theta)*dt*K) * xi);
end