k=[1 2 3 4 5 6 7 9];
c=zeros(length(k),10);
for i = 1:length(k)
    c(i,[1:k(i)+1])=pesiNewtCotes(k(i));
end
t=rats(c);