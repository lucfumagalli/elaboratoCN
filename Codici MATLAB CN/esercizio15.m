function [res,it] = esercizio15(tol)
Q = diag(2*ones(1,100)) + diag(ones(1,99),1) + diag(ones(1,99),-1);
e=((1/100) * (1:100))';
Gf=@(x)  Q*x-((pi/2).*cos((pi/2)*x)+1).*e;
Jac=@(x) Q + ((pi*pi)/4) .* sin((pi/2)*x).* diag(e);
x=zeros(100,1);
[res,it]=newtonJ(Gf,Jac,x,tol,1000);
end