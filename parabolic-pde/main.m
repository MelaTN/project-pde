theta = 0; % Choose 0 for forward Euler, 0.5 for CN and 1 for backward Euler
h = 0.1; % mesh size
x = 0:h:1;
dt = 0.025; % Time step
T = 5; % Total time
nsteps = round(T/dt); % Number of time steps

% Compute the numerical solution and the two error norms
[sol, EL2, EV] = oneRun(theta,h,dt,T);

% Plot the numerical solution at times 0,1,2 and 5
t  = (0:nsteps)*dt;
figure; hold on
for times = [0,1,2,5] %
    n = round(times/dt) + 1;
    plot(x, sol(:,n), '-')
end
xlabel('x'); ylabel('u'); title('Numerical solution'); xlim([0 1])

% Surface plot
figure
surf(t, x, sol, 'EdgeColor','none')
xlabel('t'); ylabel('x'); zlabel('u')