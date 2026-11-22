function [eL2, eV] = errorNorms(x, sol, t)
% Computes the L2-norm and the V-norm of the error (numerical solution
% minus exact solution)
xf  = linspace(0, 1, 10*(numel(x)-1) + 1);  % A finer mesh to estimate the intergral between nodes
ef  = exp(-t)*sin(2*pi*xf) - interp1(x, sol, xf); 
eL2 = sqrt(trapz(xf, ef.^2)); 
eV = sqrt(sum(diff(ef).^2 ./ diff(xf)));
end