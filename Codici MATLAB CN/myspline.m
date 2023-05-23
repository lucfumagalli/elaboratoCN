function yy = myspline(xi,fi,xx,type)
n=length(xi)-1;
h=zeros(1,n);
df=fi;
if nargin<4
    type=1;
end
for j=1:2
    for i=n+1:-1:j+1
        df(i)=(df(i)-df(i-1))/(xi(i)-xi(i-j));
    end
end
for i=2:n+1
    h(i-1)=xi(i)-xi(i-1);
end
phi=zeros(1,n-1);
eps=zeros(1,n-1);
m=zeros(1,n-1);
for i=1:n-1
    phi(i)=h(i)/(h(i)+h(i+1));
    eps(i)=h(i+1)/(h(i)+h(i+1));
    m(i)=df(i+2)*6;
end
b=phi(2:n-1);
a=2*ones(1,n-1);
c=eps(1:n-2);
if type~=0
    m(1)=m(1)*(1-phi(1));
    m(n-1)=m(n-1)*(1-eps(n-1));
    c(1)=c(1)-phi(1);
    a(1)=c(1)-phi(1);
    b(n-2)=b(n-2)-eps(n-1);
    a(n-1)=a(n-1)-eps(n-1);
end
for i=1:n-2
    b(i)=b(i)/a(i);
    a(i+1)=a(i+1)-b(i)*c(i);
    m(i+1)=m(i+1)-b(i)*m(i);   
end
m(n-1)=m(n-1)/a(n-1);
for i=n-2:-1:1
    m(i)=(m(i)-c(i)*m(i+1))/a(i);
end
if type==0
    m= [0 m 0];
else
    m = [df(2)-m(1)-m(2), m ,df(n+1)-m(n-1)-m(n-2)];
end
r=zeros(1,n);
q=zeros(1,n);
for i=1:n
    r(i)=fi(i)-((h(i)^2)/6)*m(i);
    q(i)=(fi(i+1)-fi(i))/h(i)-(h(i)/6)*(m(i+1)-m(i));
end
yy=zeros(1,length(xx));
for i=1:length(xx)
    for k=1:n
        if xx(i)>=xi(k) && xx(i)<=xi(k+1)
            yy(i)=(((xx(i)-xi(k))^3)*m(k+1)+((xi(k+1)-xx(i))^3)*m(k))/(6*h(k))+q(k)*(xx(i)-xi(k))+r(k);
            break
        end
    end
end
return