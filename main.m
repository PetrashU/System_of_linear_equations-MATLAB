Metoda = {'Jacobiego'; 'Gaussa-Seidla'; 'SOR'};

[A1,b1] = mac_1;
x1 = gauss_el(A1,b1);
[kg,xg] = iterative_gaus(A1,b1);
[kj,xj] = iterative_jacob(A1,b1);
[ks,xs] = iterative_sor(A1,b1,0.5)
n_iteracji = [kj;kg;ks];
T = table(Metoda, n_iteracji)