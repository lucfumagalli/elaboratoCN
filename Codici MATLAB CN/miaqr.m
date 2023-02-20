function [x,nr] = miaqr(A,b)
%
% [x,nr] = miaqr(A,b)
%
% La funzione miaqr fattorizza QR la matrice in ingresso A, dopodiche'  
% restituisce la soluzione x del sistema Ax=b insieme alla norma del
% vettore residuo
% 
% Input: A = matrice in ingresso
%        b = vettore dei termini noti
% Output: x = soluzione del sistema
%         nr = norma del vettore residuo
%

[m,n] = size(A);
dimb = length(b);
if n > m, error('Dimensioni matrice A errate'); end
if dimb ~= m, error('Dimensione vettore dei termini noti sbagliata'); end
for i=1:n
    alfa = norm(A(i:m,i));
    if alfa == 0, error('La matrice non ha rango massimo'), end
    if A(i,i) >= 0, alfa = -alfa; end
    v1 = A(i,i) - alfa;
    A(i,i) = alfa;
    A(i+1:m,i) = A(i+1:m,i)/v1;
    beta = -v1/alfa;
    A(i:m,i+1:n) = A(i:m,i+1:n) - (beta*[1; A(i+1:m,i)])*...
        ([1; A(i+1:m,i)]' * A(i:m,i+1:n));
end
for i=1:n
    v = [1; A(i+1:m,i)];
    beta = 2/(v'*v);
    b(i:dimb) = b(i:dimb) - (beta*(v'*b(i:dimb)))*v;
end
for i=n:-1:1
    b(i) = b(i)/A(i,i);
    b(1:i-1) = b(1:i-1) - A(1:i-1,i)*b(i);
end
x = b(1:n);
nr = norm(b(n+1:m));
end
