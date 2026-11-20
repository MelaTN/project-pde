theta = 0.5; % Choose 0 for forward Euler, 0.5 for CN and 1 for backward Euler
h = 0.01; % mesh size
x = 0:h:1; % mesh
xin = x(2:end-1)'; % Interior nodes
T = 5; % final time
dt = 0.1; % Time step
nsteps = round(T/dt); % Number of time steps

M = MassAssembler(x);
A = StiffnessAssembler(x);
K = (1/pi^2)*A - 3*M;

sol = zeros(length(xin),nsteps);
sol(:,1) = sin(2*pi*xin);


for i=2:nsteps+1
    sol(:,i) = thetaMethod(sol(:,i-1),dt,theta,M,K);
end

% Exact vs numerical solution at times 0,1,2 and 5
t  = (0:nsteps)*dt;
figure; hold on
for times = [0 1 2 5]
    n = round(times/dt) + 1;
    plot(xin, sol(:,n), 'o')           % numerical
    plot(xin, exp(-times)*sin(2*pi*xin), '-')% exact
end
xlabel('x'); ylabel('u'); title('Numerical (o) vs exact (-)')

% Surface plot
figure
surf(t, xin, sol, 'EdgeColor','none')
xlabel('t'); ylabel('x'); zlabel('u')