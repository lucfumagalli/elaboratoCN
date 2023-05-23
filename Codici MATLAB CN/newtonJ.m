function [x,nit] = newtonJ(fun,jacobian,x0,tol,maxit)
%   [x,nit] = newtonJ(fun,jacobian,x0,tol,maxit)
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
if tol<0
    error('la tolleranza non deve essere negativa');
end
if maxit<=0
    error('maxit deve essere maggiore di 0');
end
x=x0;
nit=-1;
for i=1:maxit
    fx = feval(fun,x);
    f1x = feval(jacobian,x);
    if f1x == 0, error('Derivata prima uguale a 0'); end
    dx=f1x\(-fx);
    x = x + dx';
    if abs(x-x0)<=tol*(1+abs(x0))
        nit=i;
        break;
    else
        x0 = x;
    end
end

if nit == -1, disp('Il metodo di Newton per il sistema lineare non converge');end
end

