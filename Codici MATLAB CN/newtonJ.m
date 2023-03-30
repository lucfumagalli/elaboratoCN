function [x,nit] = newtonJ(fun,jacobian,x0,tol,maxit)
%NEWTONJ Summary of this function goes here
%   Detailed explanation goes here
x=x0;
nit=-1;
if nargin==3
    tol=1e-13;
    maxit=10e3;
elseif nargin==4
    maxit=10e3;
end
if tol<0
    error('la tolleranza non può essere negativa');
end
if maxit<=0
    error('maxit deve essere maggiore di 0');
end
%controllo dimensioni jacopiana
for i=1:maxit
    fx = feval(fun,x);
    f1x = feval(jacobian,x);
    if f1x == 0, error('Derivata prima uguale a 0'); end
    dx=f1x\(-fx);
    x = x + dx';
    if norm(dx./(1+abs(x)),Inf)<=tol
        nit=i;
        break;
    end
end

if nit == -1, disp('Tolleranza desiderata non raggiunta');end
end

