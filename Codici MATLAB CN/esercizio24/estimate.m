function n = estimate(data)
%
% n = estimate(data)
%
% Stima il grado di n date m coppie di dati per y=x^n
%
%
% Input:
% data: matrice mx2 con le misurazioni del problema
%
% Output:
% n: grado stimato del polinomio
%
fixedData=data;
fixedData(fixedData(:,2)<0,:)=[];
x=fixedData(:,1);
y=log(fixedData(:,2));
r=polyfit(x,y,1);
n=r(1);
return
end
