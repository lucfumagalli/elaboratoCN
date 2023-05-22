function n = estimate(data,maxIt)
x=data(:,1);
y=data(:,2);
min=Inf;
n=0;
for i=1:maxIt
    valX=x.^i;
    res = polyfit(valX,y,1);
    r=norm(y-polyval(res,valX),"inf");
    if r<min
        min=r;
        n=i;
    end
end
return
end
