function [x,nit] = secanti(f,x0,x1,tolx,maxit)
% 
% Il metodo delle secanti serve per determinare una approssimazione della
% radice di f(x)=0 a partire da due valori iniziali x0 e x1.
% 
% Input: f = funzione di cui vogliamo trovare la radice
%        x0 = approsimazione iniziale della radice
%        x1 = approsimazione iniziale della radice
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
nit=-1;
for i=1:maxit
    fx0 = feval(f,x0);
    fx1 = feval(f,x1);
    if fx1-fx0 == 0, error('Il denominatore e'' uguale a 0');end
    x = (fx1*x0-fx0*x1)/(fx1-fx0);
    x0 = x1;
    x1 = x;
    if abs(x-x0)<=tolx * (1+abs(x0))
        nit=i;
        break;
    end
end

if nit == -1, disp('Tolleranza desiderata non raggiunta');end
end



