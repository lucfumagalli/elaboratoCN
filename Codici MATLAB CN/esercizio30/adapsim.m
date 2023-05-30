function [I2,vf] = adapsim(a,b,f,tol,fa,f1,fb)
%
%   [I2,vf] = adapsim(a,b,f,tol)
% 
%   Calcola la formula adattiva di Simpson
%
%   Input:
%   a,b: estremi intervallo di integrazione
%   f: function funzione integranda
%   tol: tolleranza richiesta
%   Output:
%   I2: approssimazione ottenuta
%   vf: valutazioni funzionali
%
if a==b
    I2=0;
    return
elseif a>b
    error('intervallo non corretto');
elseif tol<0
    error('tolleranza negativa');
end
x1=(a+b)/2;
vf=0;
if nargin==4
    fa=feval(f,a);
    fb=feval(f,b);
    f1=feval(f,x1);
    vf=3;
end
h=(b-a)/6;
I1=h*(fa+4*f1+fb);
x2=(a+x1)/2;
x3=(x1+b)/2;
f2=feval(f,x2);
f3=feval(f,x3);
I2=.5*h*(fa+4*f2+2*f1+4*f3+fb);
vf=vf+2;
e=abs(I2-I1)/15;
if e>tol
    [left,vf1]=adapsim(a,x1,f,tol/2,fa,f2,f1);
    [right,vf2]=adapsim(x1,b,f,tol/2,f1,f3,fb);
    I2=left+right;
    vf=vf+vf1+vf2;
end
return
end