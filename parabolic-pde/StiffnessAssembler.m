function A = StiffnessAssembler(x)
n = length(x)-1;
A = zeros(n+1,n+1);
for i = 1:n
    h = x(i+1) - x(i);
    A(i,i) = A(i,i) + 1/h;
    A(i,i+1) = A(i,i+1) - 1/h;
    A(i+1,i) = A(i+1,i) - 1/h;
    A(i+1,i+1) = A(i+1,i+1) + 1/h;
end
A = A(2:end-1, 2:end-1);   % impose u(0)=u(1)=0
end