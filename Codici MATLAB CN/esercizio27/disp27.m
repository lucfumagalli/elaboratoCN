x = linspace(0,1,10001);
y=fun27(x);
n=12;
x2=linspace(0,1,n+1);
y2=fun27(x2);
plot(x,y,'linewidth',1);
hold on;
title('Function');
xlabel('x');
ylabel('y');
plot(x2,y2,'o','linewidth',2);
hold off;
l=legend('f(x)','(xi,fi)');
l.FontSize=15;

