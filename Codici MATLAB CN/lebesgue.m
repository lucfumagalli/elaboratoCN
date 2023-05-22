function ll = lebesgue(a,b,nn,type)
    n=length(nn);
    ll=zeros(1,length(nn));
    f=0;
    if type==1
        f=@(n) cheby(n,a,b);
    elseif type==0
        f=@(n) linspace(a,b,n+1);
    end
    for i=1:n
        xi=f(nn(i));
        x=linspace(a,b,10001);
        L=zeros(size(x));
        for j=1:length(xi)
            L=L+abs(Lin(j,xi,x));
        end
        ll(i)=max(L);
    end
    return
end