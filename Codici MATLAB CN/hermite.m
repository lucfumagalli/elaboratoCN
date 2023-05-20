function yy = hermite(xi, fi, f1i, xx)
%
%   p=hermite(xi, fi, ,f1i, xx)
%
%   Calcolo del polinomio interpolante di Hermite:
%
%   Input:
%   xi: ascisse di interpolazione
%   fi: valori della funzione interpolanda nelle ascisse di interpolazione
%   f1i: valori della derivata prima della funzione interpolanda nelle
%   ascisse di interpolazione
%   xx: valori su cui calcolare il valore del polinomio interpolante
%
%   Output:
%   yy: vettore con i valori calcolati
%
n=length(xi)-1;
xi=repelem(xi,2);
fi=repelem(fi,2);
fi(2:2:end)=f1i;
for i = (2*n+1):-2:3
    fi(i)=(fi(i)-fi(i-2))/(xi(i)-xi(i-1));
end
for j=2:2*n+1
    for i = (2*n+2):-1:j+1
        fi(i)= (fi(i)-fi(i-1))/(xi(i)-xi(i-j));
    end
end
yy=horner(xi,fi,xx);
return
end