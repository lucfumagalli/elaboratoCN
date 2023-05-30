function plotEquiCheby(a,b,f,p,n,name,f1)
    err=size(n);
    errCheby=size(n);
    if nargin==6
        for i=1:length(n)
            x=linspace(a,b,n(i)+1);
            y=feval(f,x);
            xx=linspace(a,b,10001);
            yy=p(x,y,xx);
            errEqui(i)=max(abs(f(xx)-yy));
            x=cheby(n(i),a,b);
            y=feval(f,x);
            yy=p(x,y,xx);
            errCheby(i)=max(abs(f(xx)-yy));
        end
    else
        for i=1:length(n)
            x=linspace(a,b,n(i)+1);
            y=f(x);
            y1=f1(x);
            xx=linspace(a,b,10001);
            yy=hermite(x,y,y1,xx);
            errEqui(i)=norm(f(xx)-yy,inf);
            x=cheby(n(i),a,b);
            y=f(x);
            y1=f1(x);
            yy=hermite(x,y,y1,xx);
            errCheby(i)=norm(f(xx)-yy,inf);
        end
    end
    semilogy(n,errEqui);
    hold on;
    semilogy(n,errCheby);
    title(name);
    legend("Equidistanti","Chebyshev");
    xlabel("n");
    ylabel("errore");
    hold off;
end

