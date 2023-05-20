function p = horner(x, f, xq)
%
%   p=horner(x, f, ,xq)
%
%   Algoritmo di horner generalizzato per il calcolo di un polinomio:
%
%   Input:
%   x: ascisse di interpolazione
%   f: valori delle differenze divise
%   xq: valori su cui calcolare il polinomio
%
%   Output:
%   p: vettore con i valori calcolati
%
n=length(x)-1;
p=ones(size(xq))*f(n+1);
for i=n:-1:1
    p=p.*(xq-x(i))+f(i);
end
return
end

