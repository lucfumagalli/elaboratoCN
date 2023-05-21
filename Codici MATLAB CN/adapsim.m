function [I2,fe] = adapsim(a,b,f,tol,fa,f1,fb)
%
%
%
%
%
%
%
%
%
if a==b
    I2=0;
    return
elseif a>b
    error('intervallo non corretto');
elseif tol<0
    error('tolleranza negativa');
end
fe=0;
I2=0;
x1=(a+b)/2;
fe=0;
if nargin==4
    fa=feval(f,a);
    fb=feval(f,b);
    f1=feval(f,x1);
    fe=3;
end
h=(b-a)/6;
I1=h*(fa+4*f1+fb);
x2=(a+x1)/2;
x3=(x1+b)/2;
f2=feval(f,x2);
f3=feval(f,x3);
I2=.5*h*(fa+4*f2+2*f1+4*f3+fb);
fe=fe+2;
e=abs(I2-I1)/15;
if e>tol
    [left,fe1]=adapsim(a,x1,f,tol/2,fa,f2,f1);
    [right,fe2]=adapsim(x1,b,f,tol/2,f1,f3,fb);
    I2=left+right;
    fe=fe+fe1+fe2;
end
return
end