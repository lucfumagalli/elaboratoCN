function c = pesiNewtCotes(n)
%
%   c=pesiNewtCotes
%
%   Calcolo dei pesi della formula di Newton Cotes:
%
%   Input:
%   n: grado della formula
%
%   Output:
%   c: vettore con i pesi
%
if n<1 || n~=fix(n)
    error('n deve essere un numero naturale');
else
c=zeros(1,n+1);
for i=0:n/2
    den = prod( i - [0:i-1, i+1:n]);
    coeff = poly([0:i-1 i+1:n]);
    coeff = [coeff./((n+1):-1:1) 0];
    num=polyval(coeff,n);
    c(i+1)=num/den;
end
for i=n+1:-1:n/2
    c(i) = c(n+2-i);
end
return
end