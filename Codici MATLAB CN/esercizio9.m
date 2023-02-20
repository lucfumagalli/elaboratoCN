% A = [2 2 1; 2 5 0; 1 0 1];
% x = [2 -1 1]';
A = randi([-3,3],3);
di = randi([3,6],3,1);
A = tril(A,-1) + triu(A',1) + diag(di);
x = randi([-3,3],3,1);
b = A*x;
xMatlab = linsolve(A,b);
xMialdl = mialdl(A,b);

A = randi([-3,3],4);
di = randi([3,7],4,1);
A = tril(A,-1) + triu(A',1) + diag(di);
x = randi([-4,3],4,1);
b = A*x;
xMatlab = linsolve(A,b);
xMialdl = mialdl(A,b);