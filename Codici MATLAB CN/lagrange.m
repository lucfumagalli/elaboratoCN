function p = lagrange(x, y, xq)
%
%   p=lagrange(x, y, xq)
%
%   Calcolo del polinomio interpolante in base di Lagrange:
%
%   Input:
%   x: ascisse di interpolazione
%   y: valori della funzione interpolanda nelle ascisse di interpolazione
%   xq: valori su cui calcolare il valore del polinomio interpolante
%
%   Output:
%   p: vettore con i valori calcolati
%
n=length(x);
p=zeros(size(xq));
for i=1:n
    p=p+y(i)*Lin(i,x,xq);
end
return
end

