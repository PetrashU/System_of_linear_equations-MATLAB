function [k,x] = iterative_jacob(A,b)
    B = diag(diag(A));
    x = zeros(size(b));
    x0=x;

    r = B\(B - A);
    s = B\b;

    k=0;
    while k==0 || norm(x-x0) > 1e-4
        k=k+1;
        x0=x;
        x = r*x + s;
    end
end