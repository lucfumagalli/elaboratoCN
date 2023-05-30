approssimato = zeros(1,20);
esatto = zeros(1,20);
errore = zeros(1,20);
x = logspace(log10(1e-10),log10(1e10),20);
for i = 1:20
    approssimato(i) = radice(x(i));
    esatto(i) = (x(i))^(1/6);
    errore(i) = abs(approssimato(i)-esatto(i));
end
variabili = { 'n' , 'approssimato' , 'esatto' ,  'errore' };
table(x',approssimato',esatto', errore','VariableNames',variabili);
