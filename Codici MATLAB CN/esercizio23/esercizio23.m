n=4:4:400;
f=@(x) 1./(1+x.^2);
err=zeros(length(n),1);
for i=1:length(n)
    xi=linspace(-5,5,n(i)+1);
    fi=f(xi);
    xx=linspace(-5,5,10001);
    yy=myspline(xi,fi,xx,0);
    err(i)=max(abs(f(xx)-yy));
end
semilogy(n,err);
xlabel('n');
ylabel('errore');
title('Spline naturale');
figure;
for i=1:length(n)
    xi=linspace(-5,5,n(i)+1);
    fi=f(xi);
    xx=linspace(-5,5,10001);
    yy=myspline(xi,fi,xx,1);
    err(i)=max(abs(f(xx)-yy));
end
semilogy(n,err);
xlabel('n');
ylabel('errore');
title('Spline not-a-knot');

