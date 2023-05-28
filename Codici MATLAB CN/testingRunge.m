function testingRunge(n)
f=@(x) 1./(1+x.^2);
x=linspace(-5,5,n+1);
y=feval(f,x);
xx=linspace(-5,5,10001);
yy=newtonP(x,y,xx);
plot(xx,yy);
hold on;
yy=lagrange(x,y,xx);
plot(xx,yy);
yy=feval(f,xx);
plot(xx,yy);
legend('newton','lagrange',"runge");
hold off;
end

