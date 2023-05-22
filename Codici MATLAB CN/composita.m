function [If,err] = composita(fun, a, b, k, n)
x=linspace(a,b,n+1);
y=fun(x);
h=(b-a)/n;
c=pesiNewtCotes(k);
If=0;
for i=1:k:n+1-k
    If=If+sum(y(i:i+k).*c);
end
If=h*If;
IfH=0;
for i=1:2*k:n+1-2*k
    IfH=IfH+sum(y(i:2:i+2*k).*c);
end
IfH=2*h*IfH;
if mod(k,2)==1
    u=1;
else
    u=2;
end
err=abs(IfH-If)/(2^(k+u)-1);