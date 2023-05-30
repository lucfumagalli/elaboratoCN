Q = diag(2*ones(1,100)) + diag(ones(1,99),1) + diag(ones(1,99),-1);
e=((1/100) * (1:100))';
Gf=@(x)  Q*x-((pi/2).*cos((pi/2)*x)+1).*e;
Jac=@(x) Q + ((pi*pi)/4) .* sin((pi/2)*x).* diag(e);
x=zeros(100,1);
tol= [1e-3,1e-8,1e-13];
resX=zeros(100,3);
for i=1:length(tol)
    [res,it]=newton(Gf,Jac,x,tol(i),1000);
    resX(:,i)=res;
end
hold on;
plot(1:100,resX(:,[1:3]));
legend;
hold off;
figure;
hold on;
plot(1:100,Gf(resX(:,[1:3])));
legend;
hold off;