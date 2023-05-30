function L = Lin(i, xi, x)
%
%   L=Lin(i,xi,x)
%
%   Calcolo della base di Lagrange
%
%   Input:
%   i: indice
%   xi: ascisse di interpolazione
%   x: valori su cui calcolare la base di Lagrange
%
%   Output:
%   L: vettore con i valori della base di Lagrange con indice i
%
L=ones(size(x));
zi=xi(i);
xi(i)=[];
n=length(xi);
for j=1:n
    L=L.*(x-xi(j));
end
L=L/prod(zi-xi);
return
end

