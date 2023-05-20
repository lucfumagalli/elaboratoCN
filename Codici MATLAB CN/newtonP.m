function p = newton(x, y, xq)
%
%   p=newton(x, y, xq)
%
%   Calcolo del polinomio interpolante in base di Newton:
%
%   Input:
%   x: ascisse di interpolazione
%   y: valori della funzione interpolanda nelle ascisse di interpolazione
%   xq: valori su cui calcolare il valore del polinomio interpolante
%
%   Output:
%   p: vettore con i valori calcolati
%
n = length(x)-1;
for j=1:n
    for i=n+1:-1:j+1
        y(i)=(y(i)-y(i-1))/(x(i)-x(i-j));
    end
end
p=horner(x,y,xq);
return
end

