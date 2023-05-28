function esercizio21()
nn=2:2:100;
nnH=3:2:99;
f=@(x) 1./(1+x.^2);
f1=@(x) (-2*x)./((1+x.^2).^2);
xx=linspace(-5,5,10001);
errLinLag=zeros(1,length(nn));
errChebyLag=zeros(1,length(nn));
errLinNewt=zeros(1,length(nn));
errChebyNewt=zeros(1,length(nn));
errLinHer=zeros(1,length(nn));
errChebyHer=zeros(1,length(nn));
for i=1:length(nn)
    x=linspace(-5,5,nn(i)+1);
    x2=cheby(nn(i),-5,5);
    y=feval(f,x);
    y2=feval(f,x2);
    yy=feval(f,xx);
    yyC=lagrange(x,y,xx);
    errLinLag(i)=max(abs(yy-yyC));
    yyC=newtonP(x,y,xx);
    errLinNewt(i)=max(abs(yy-yyC));
    yyC=lagrange(x2,y2,xx);
    errChebyLag(i)=max(abs(yy-yyC));
    yyC=newtonP(x2,y2,xx);
    errChebyNewt(i)=max(abs(yy-yyC));
end
for i=1:length(nnH)
    x=linspace(-5,5,nnH(i)+1);
    x2=cheby(nnH(i),-5,5);
    y=feval(f,x);
    y1=feval(f1,x);
    y2=feval(f,x2);
    y12=feval(f,x2);
    yy=feval(f,xx);
    errLinHer(i)=max(abs(yy-hermite(x,y,y1,xx)));
    errChebyHer(i)=max(abs(yy-hermite(x2,y2,y12,xx)));
end
semilogy(nn,errLinLag);
hold on;
semilogy(nn,errChebyLag);
legend('equidistanti','chebyshev');
hold off;
figure;
semilogy(nn,errLinNewt);
hold on;
semilogy(nn,errChebyNewt);
legend('equidistanti','chebyshev');
hold off;
figure;
semilogy(nn,errLinHer);
hold on;
semilogy(nn,errChebyHer);
legend('equidistanti','chebyshev');
hold off;