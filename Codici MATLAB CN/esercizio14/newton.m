function [x,nit] = newton(fun,jacobian,x0,tol,maxit)
%   [x,nit] = newton(fun,jacobian,x0,tol,maxit)
%   Funzione che implementa il metodo di Newton per sistemi 
%   di equazioni nonlineari
%   
%   Input:
%   fun: function funzione di un sistema nonlineare
%   jacobian: matrice jacobiana di fun
%   x0: approssimazione iniziale
%   tol: tolleranza richiesta
%   maxit: massimo numero di iterazioni richiesto
%   Output:
%   x: risultato del metodo di Newton
%   nit: numero di iterazioni effettuate
%
if nargin < 3
    error('numero argomenti insufficienti');
elseif nargin==3
    tol=1e-13;
    maxit=10e3;
elseif nargin==4
    maxit=10e3;
end
x=x0;
nit=-1;
if tol<0
    error('la tolleranza non può essere negativa');
end
if maxit<=0
    error('maxit deve essere maggiore di 0');
end
[n,m] = size(jacobian);
nf = size(fun);
if (n~=m)
    error('La matrice Jacobiana deve essere quadrata');
end
if n~=nf
        error('Il numero di righe del vettore fun e della Jacobiana sono diversi');
end
for i=1:maxit
    fx = feval(fun,x);
    f1x = feval(jacobian,x);
    dx=-f1x\(fx);
    x = x + dx;
    if norm(dx./(1+abs(x)),Inf)<=tol
        nit=i;
        break;
    end
end

if nit == -1, disp('Il metodo di Newton per il sistema lineare non converge');end
return
end

