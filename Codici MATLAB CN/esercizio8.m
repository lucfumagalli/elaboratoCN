A = randi([-5,5],3);
x = randi([-5,5],3,1);
b = A*x;
xMatlab = linsolve(A,b);
xMialu = mialu(A,b);
 
 A = randi([-3,3],4);
 x = randi([-3,3],4,1);
 b = A*x;
 xMatlab = linsolve(A,b);
 xMialu = mialu(A,b);