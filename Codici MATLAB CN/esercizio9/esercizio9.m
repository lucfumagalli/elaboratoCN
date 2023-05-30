A = randi([-3,3],3);
di = randi([3,6],3,1);
A = tril(A,-1) + triu(A',1) + diag(di);
x = randi([-3,3],3,1);
b = A*x;
xMatlab = linsolve(A,b);
xMialdl = mialdlt(A,b);

A2 = randi([-3,3],4);
di = randi([3,7],4,1);
A2 = tril(A2,-1) + triu(A2',1) + diag(di);
x2 = randi([-4,3],4,1);
b2 = A2*x2;
x2Matlab = linsolve(A2,b2);
x2Mialdl = mialdlt(A2,b2);