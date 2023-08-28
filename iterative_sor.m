function [k,x] = iterative_sor(A,b,w)
if w<=0 || w>=2
    error("Nieprawidłowa wartość w!");
end

n = length(b);
D = diag(diag(A));
E = -tril(A,-1);
L = D\E;

B = 1./w * D * (eye(n) - w * L);

x = zeros(size(b));
x0=x;

r = B\(B - A);
s = B\b;

k = 0;

while k==0 || norm(x-x0) > 1e-4
    k=k+1;
    x0 = x;
    x = r*x + s;
end
end