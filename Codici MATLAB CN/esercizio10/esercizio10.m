A = randi([-5,5],4,3);
b = randi([-10,10],4,1);
x = A\b;
[xMiaqr,nr] = miaqr(A,b);

A2 = randi([-5,5],5,4);
b2 = randi([-10,10],5,1);
x2 = A\b;
[xMiaqr2,nr2] = miaqr(A,b);
