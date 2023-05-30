function x = mialu(A,b)
% x = mialu(A,b)
% data in ingresso una matrice A ed un vettore b, calcoli la soluzione del 
% sistema lineare Ax = b con il metodo di fattorizzazione LU con pivoting 
% parziale. 
% Input: A = matrice in ingresso che va fattorizzata LU con il metodo di 
%            pivoting parziale
%        b = vettore dei termini noti
% Output: x = vettore soluzione di Ax=b
%

[m,n] = size(A);
dimb = length(b);
if m ~= n 
    error("La matrice dei coefficenti A deve essere quadrata")
end
if m ~= dimb
    error("La matrice A ed il vettore b hanno dimensioni discordanti")
end
p = [1:n];
for i =1:n-1
    [mi,ki] = max(abs(A(i:n,i)));
    if mi == 0
        error('La matrice non puo'' essere singolare');
    end
    ki = ki + i - 1;
    if ki > i 
        % inverto la riga i-esima e ki-esima
        A([i,ki],:) = A([ki,i],:);
        % stessa cosa nel vettore delle permutazioni
        p([i,ki]) = p([ki,i]);
    end
    A(i+1:n,i) = A(i+1:n,i)/A(i,i);
    A(i+1:n,i+1:n) = A(i+1:n,i+1:n) - A(i+1:n,i)*A(i,i+1:n);
end
x = b(p);
for i = 1:n
    x(i+1:n) = x(i+1:n)-A(i+1:n,i)*x(i);
end
x(n) = x(n)/A(n,n);
for i = n-1:-1:1
    x(1:i) = x(1:i) - A(1:i,i+1)*x(i+1);
    x(i) = x(i)/A(i,i);
end
return
end

