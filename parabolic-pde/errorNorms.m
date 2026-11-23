function [eL2, eV] = errorNorms(x, sol, t)
% Computes the L2-norm and the V-norm of the error (exact minus numerical)
xf  = linspace(0, 1, 10*(numel(x)-1) + 1);  % A finer mesh to estimate the intergral between nodes
ef  = exp(-t)*sin(2*pi*xf) - interp1(x, sol, xf); % Approximation of the error at time t
eL2 = sqrt(trapz(xf, ef.^2)); % Computing the L2 norm of the error

% Computing the V-norm of the error
def = gradient(ef, xf); % Approximate the derivative
eV = sqrt(trapz(xf, def.^2) + eL2^2); % Compute the V-norm
end