function disp24(data)
x=data(:,1);
y=data(:,2);
n=40;
valX=[1:n];
valY=zeros(1,length(1:n));
for i=1:n
    valY(i)=abs(max(x.^i-y));
end

semilogy(valX,valY,'LineWidth',1);
hold on;
title('errori');
xlabel('n');
ylabel('errore');
end

