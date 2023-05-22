function [I2,fe] = adapquad(a,b,f,tol,fa,f1,f2,f3,fb)
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
x2=(a+b)/2;
x1=(a+x2)/2;
x3=(x2+b)/2;
if nargin==4
    fa=feval(f,a);
    fb=feval(f,b);
    f1=feval(f,x1);
    f2=feval(f,x2);
    f3=feval(f,x3);
    fe=5;
end
h=(b-a)/180;
I1=h*(14*fa+64*f1+24*f2+64*f3+14*fb);
x4=(a+x1)/2;
x5=(x1+x2)/2;
x6=(x2+x3)/2;
x7=(x3+b)/2;
f4=feval(f,x4);
f5=feval(f,x5);
f6=feval(f,x6);
f7=feval(f,x7);
I2=.5*h*(14*fa+64*f4+24*f1+64*f5+28*f2+64*f6+24*f3+64*f7+14*fb);
fe=fe+4;
e=abs(I2-I1)/63;
if e>tol
    [left,fe1]=adapquad(a,x2,f,tol,fa,f4,f1,f5,f2);
    [right,fe2]=adapquad(x2,b,f,tol,f2,f6,f3,f7,fb);
    I2=left+right;
    fe=fe+fe1+fe2;
end
return
end

