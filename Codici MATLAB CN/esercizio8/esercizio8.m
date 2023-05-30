A = randi([-5,5],3);
x = randi([-5,5],3,1);
b = A*x;
xMatlab = linsolve(A,b);
xMialu = mialu(A,b);
 
 A2 = randi([-3,3],4);
 x2 = randi([-3,3],4,1);
 b2 = A2*x2;
 xMatlab2 = linsolve(A2,b2);
 xMialu2 = mialu(A2,b2);