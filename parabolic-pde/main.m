theta = 0; % Choose 0 for forward Euler, 0.5 for CN and 1 for backward Euler
h = 0.01; % mesh size
x = 0:h:1; % mesh
T = 5; % final time
dt = 0.1;
xi0 = sin(2*pi*x);
M = MassAssembler(x);
A = StiffnessAssembler(x);
K = (1/pi^2)*A - 3*M;

for i=1:round(T/dt)
    xi = thetaMethod(xi,x,dt,theta);
end