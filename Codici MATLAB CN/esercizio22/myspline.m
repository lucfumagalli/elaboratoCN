function yy = myspline(xi,fi,xx,type)
%
% yy=myspline(xi,fi,xx,type)
%
% Calcolo dei valori della spine interpolante le ascisse
%
%
% Input:
% xi: vettori con le ascisse di interpolazione
% fi: vettore con i valori della funzione per le ascisse
% xx: vettore con i valori su cui calcolare la spline
% type: 0 per la spline naturale, diverso da 0 per not-a-knot (default)
%
% Output:
% yy: vettore con i valori della spline calcolati 
%
n=length(xi)-1;
if length(unique(xi))~=n+1
    error("Le ascisse non sono distinte tra loro");
end
if length(fi)~=n+1
    error("I vettori xi ed fi devono avere la stessa lunghezza");
end
h=zeros(1,n);
df=fi;
if nargin<4
    type=1;
end
for j=1:2 %differenze divise
    for i=n+1:-1:j+1
        df(i)=(df(i)-df(i-1))/(xi(i)-xi(i-j));
    end
end
h=xi(2:n+1)-xi(1:n);
phi(1:n-1)=h(1:n-1)./(h(1:n-1)+h(2:n));
eps(1:n-1)=h(2:n)./(h(1:n-1)+h(2:n));
m(1:n-1)=df(3:n+1)*6;
b=phi(2:n-1);
a=2*ones(1,n-1);
c=eps(1:n-2);
if type~=0 %cambio della prima riga e ultima riga per not-a-knot
    m(1)=m(1)*(1-phi(1));
    m(n-1)=m(n-1)*(1-eps(n-1));
    c(1)=c(1)-phi(1);
    a(1)=a(1)-phi(1);
    b(n-2)=b(n-2)-eps(n-1);
    a(n-1)=a(n-1)-eps(n-1);
end
%risoluzione matrice tridiagonale
for i=1:n-2
    b(i)=b(i)/a(i);
    a(i+1)=a(i+1)-b(i)*c(i);
    m(i+1)=m(i+1)-b(i)*m(i);   
end
m(n-1)=m(n-1)/a(n-1);
for i=n-2:-1:1
    m(i)=(m(i)-c(i)*m(i+1))/a(i);
end
%condizioni spline naturale e not-a-knot
if type==0
    m= [0 m 0];
else
    m = [df(3)-m(1)-m(2), m ,df(n+1)-m(n-1)-m(n-2)];
end
%calcolo di r e q
r=zeros(1,n);
q=zeros(1,n);
for i=1:n
    r(i)=fi(i)-((h(i)^2)/6)*m(i);
    q(i)=(fi(i+1)-fi(i))/h(i)-(h(i)/6)*(m(i+1)-m(i));
end
%calcolo spline
yy=zeros(1,length(xx));
for i=1:length(xx)
    for k=1:n
        if xx(i)>=xi(k) && xx(i)<=xi(k+1)
            yy(i)=(((xx(i)-xi(k))^3)*m(k+1)+((xi(k+1)-xx(i))^3)*m(k))/( ...
                6*h(k))+q(k)*(xx(i)-xi(k))+r(k);
            break
        end
    end
end
return
end