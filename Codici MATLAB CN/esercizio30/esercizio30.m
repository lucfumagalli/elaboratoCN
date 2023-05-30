tol=10.^((-2:-1:-9));
f=@(x) (x^(-1)*cos(log(x^(-1))));
sim=zeros(1,length(tol));
simf=zeros(1,length(tol));
quad=zeros(1,length(tol));
quadf=zeros(1,length(tol));
for i=1:length(tol)
    [sim(i),simf(i)]=adapsim(1e-5,1,f,tol(i));
    
    [quad(i),quadf(i)]=adapquad(1e-5,1,f,tol(i));
end

errS=abs(sin(log(10^5))-sim);
valutazioni=table(tol',simf',quadf','VariableNames',{'tol' 'vf sim' 'vf quad'});
errQ=abs(sin(log(10^5))-quad);
errS=abs(sin(log(10^5))-sim);
errore=table(tol',sim',errS', quad',errQ','VariableNames',{'tol' 'sim' 'errSim' 'quad' 'errQuad'})