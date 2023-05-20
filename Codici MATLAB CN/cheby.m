function x = cheby(n,a,b)
%
%   x=cheby(n,a,b)
%
%   Calcolo delle ascisse di Chebyshev:
%
%   Input:
%   n: grado del polinomio
%   a,b: estremi dell'intervallo
%
%   Output:
%   x: vettore contentente le ascisse di Chebyshev
if n<1 || n~=fix(n)
    error('n deve essere un numero naturale');
elseif a>=b
    error('l''intervallo non e'' corretto');
end
x=(a+b)/2 + cos((2*(n:-1:0)+1)*pi./(2*(n+1))) * (b-a)/2;
return
end

