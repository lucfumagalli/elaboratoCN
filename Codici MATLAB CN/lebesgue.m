function ll = lebesgue(a,b,nn,type)
%
%   ll = lebesgue(a,b,nn,type)
%   Calcola un'approssimazione della costante di Lebesgue per 
%   l'interpolazione polinomiale sull'intervallo [a,b]
%
%   Input:
%   a,b: estremi intervallo
%   nn: grado dei polinomi
%   type: 
%       0 - ascisse equidistanti
%       1 - ascisse di Chebyshev
%   Output:
%   ll: approssimazione costante di Lebesgue ottenuta   
%
n=length(nn);
ll=zeros(1,length(nn));
f=0;
if type==1
    f=@(n) cheby(n,a,b);
elseif type==0
    f=@(n) linspace(a,b,n+1);
end
for i=1:n
    xi=f(nn(i));
    x=linspace(a,b,10001);
    L=zeros(size(x));
    for j=1:length(xi)
        L=L+abs(Lin(j,xi,x));
    end
    ll(i)=max(L);
end
return
end