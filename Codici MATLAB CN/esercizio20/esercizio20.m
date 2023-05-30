nn=1:100;
ll=lebesgue(0,1,nn,0);
plot(nn,ll);
title('equidistanti su [0,1]')
xlabel('nn')
ylabel('lebesgue')
figure;
ll=lebesgue(0,1,nn,1);
plot(nn,ll);
title('chebyshev su [0,1]')
xlabel('nn')
ylabel('lebesgue')
figure;
ll=lebesgue(-3,7,nn,0);
plot(nn,ll);
title('equidistanti su [-3,7]')
xlabel('nn')
ylabel('lebesgue')
figure;
ll=lebesgue(-3,7,nn,1);
plot(nn,ll);
title('chebyshev su [-3,7]')
xlabel('nn')
ylabel('lebesgue')