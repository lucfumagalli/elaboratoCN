function [x,nit] = newton(f,f1,x0,tolx,maxit)
% Il metodo di Newton serve per determinare una approssimazione della
% radice a partire da un'approssimazione iniziale.
% 
% Input: f = funzione di cui vogliamo trovare la radice
%        f1 = derivata prima della funzione f
%        x0 = approsimazione iniziale della radice
%        tolx = tolleranza fissata
%        maxit = massimo numero di iterazioni fissato
%
% Output: x = radice della funzione f
%         nit = numero di iterazioni svolte, vale -1 se la tolleranza non
%         e' soddisfatta entro maxit o la derivata si annulla
%
if nargin<4, error('Argomenti in input non sufficienti')
elseif nargin==4, maxit=100;end
if tolx<eps, error('Tolleranza non valida');end

x=x0;
nit=-1;
for i=1:maxit
    fx = feval(f,x);
    f1x = feval(f1,x);
    if f1x == 0, error('Derivata prima uguale a 0'); end
    x = x - fx/f1x;
    if abs(x-x0)<=tolx * (1+abs(x0))
        nit=i;
        break;
    else
        x0 = x;
    end
end

if nit == -1, disp('Tolleranza desiderata non raggiunta');end
end

