n=12;
maxK=6;
k=[1 2 3 6];
res=size(length(k),1);
err=size(length(k),1);
f=@(x) fun27(x);
for i=1:length(k)
    [res(i),err(i)]=composita(f,0,1,k(i),n);
end
table(k',res',err','VariableNames',{'k' 'risulato' 'errore'})