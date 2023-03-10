function x = mialdl(A,b)
% x = mialdl(A,b)
% data in ingresso una matrice A ed un vettore b, calcoli la soluzione del 
% sistema lineare Ax = b con il metodo di fattorizzazione LDL^T.

% Input: A = matrice in ingresso che va fattorizzata LDL^T
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
if A(1,1) <= 0, error('la matrice non e'' sdp'); end
A(2:n,1) = A(2:n,1)/A(1,1);
for j = 2:n
    v = (A(j,1:j-1).') .* diag(A(1:j-1,1:j-1));
    A(j,j) = A(j,j) - A(j,1:j-1)*v;
    if A(j,j) <= 0, error('la matrice non e'' sdp'); end
    A(j+1:n,j) = (A(j+1:n,j) - A(j+1:n,1:j-1) * v)/A(j,j);
end
x = b;
for i=1:n
    x(i+1:n) = x(i+1:n)-(A(i+1:n,i)*x(i));
end
x = x./diag(A);
for i=n:-1:2
    x(1:i-1) = x(1:i-1)-A(i,1:i-1).'*x(i);
end 
end
