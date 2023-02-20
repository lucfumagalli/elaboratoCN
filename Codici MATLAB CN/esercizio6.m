f = @(x) x - cos(x);
f1 = @(x) 1 + sin(x);
tolx = [1e-3,1e-6,1e-9,1e-12];
x0=0;
x1=0.1;

resultNewton = zeros(4,2);
resultSecanti = zeros(4,2);

for i=1:4
    [resultNewton(i,1),resultNewton(i,2)] = newton(f,f1,x0,tolx(i));
    [resultSecanti(i,1),resultSecanti(i,2)] = secanti(f,x0,x1,tolx(i));
end

table(resultNewton,resultSecanti,'VariableNames',{'Radici Newton | i' 'Radici secanti | i'})