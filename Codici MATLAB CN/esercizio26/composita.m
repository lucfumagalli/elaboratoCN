function [If,err] = composita(fun, a, b, k, n)
%
%   [If,err] = composita(fun,a,b,k,n)
%
%   Stima dell'integrale definito cone le formule composite di Newton-Cotes
%
%   Input:
%   fun: funzione integrale
%   a : lato destro intervallo di integrazione 
%   b: lato destron intervallo di integrazione
%   k: grado della formula di Newton-Cotes
%   n: numero di punti da usare (deve essere un multiplo pari di k)
%
%   Output:
%   If: valore dell'integrale
%   err: stima dell'errore
%
if a==b
    If=0;
    err=0;
    return
end
if a>b
    error('intervallo non corretto');
end
if mod((n/k),2)~=0
    error('n deve essere un multiplo pari di k');
end
x=linspace(a,b,n+1);
y=fun(x);
disp(y);
h=(b-a)/n;
c=pesiNewtCotes(k);
disp(c);
If=0;
for i=1:k:n+1-k
    If=If+sum(y(i:i+k).*c);
    disp(If);
end
If=h*If;
IfH=0;
for i=1:2*k:n+1-2*k
    IfH=IfH+sum(y(i:2:i+2*k).*c);
end
IfH=2*h*IfH;
u = 2-mod(k,2);
err=abs(IfH-If)/(2^(k+u)-1);
return