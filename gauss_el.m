function x = gauss_el(A,b)
n = size(A,1);
if n ~= size(A,2)
    error('Macierz nie jest kwadratowa');
elseif n ~= size(b)
    error('Nie zgadzają się wymiary A i b');
end
ab = [A,b];
for i=1:n-1
    max_i = i;
    max = ab(i,i);
    for j=i+1:n
        if abs(ab(j,i)) > abs(max)
            max = ab(j,i);
            max_i = j;
        end
    end
    if max == 0
        error('Układ osobliwy');
    end
    tmp = ab(i,:);
    ab(i,:) = ab(max_i,:);
    ab(max_i,:) = tmp;
    for j=i+1:n %wierszy
        a = ab(j,i);
        for k=i:n+1     %kolumny
            ab(j,k) = ab(j,k) - a/ab(i,i) * ab(i,k);
        end
    end
end

x(n) = ab(n,n+1)/ab(n,n);
for i=n-1:-1:1
    m = ab(i,n+1);
    for j=n:-1:i+1
        m = m - ab(i,j)*x(j);
    end
    x(i) = m/ab(i,i);
end
end