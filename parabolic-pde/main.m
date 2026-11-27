theta = 0.5; % Choose 0 for forward Euler, 0.5 for CN and 1 for backward Euler
h = 0.0001; % mesh size
x = 0:h:1; % mesh
dt = 0.1; % Time step
T = 5; % Total time
nsteps = round(T/dt); % Number of time steps

% Compute the numerical solution and the two error norms
[sol, EL2, EV] = oneRun(theta,h,dt,T);

% Plot the numerical solution at time(s) of choice
t  = (0:nsteps)*dt;
figure; hold on
for times = [5] %
    n = round(times/dt) + 1;
    plot(x, sol(:,n), '-')
end
xlabel('x'); ylabel('u'); title('Numerical solution'); xlim([0 1])

% Surface plot
figure
surf(t, x, sol, 'EdgeColor','none')
xlabel('t'); ylabel('x'); zlabel('u')

% Printing the error norms to the console
disp(['The L^∞(0,5; L²) error norm is ' num2str(EL2)])
disp(['The L²(0,5; V) error norm is ' num2str(EV)])