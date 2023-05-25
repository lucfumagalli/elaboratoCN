function n = estimate(data)
fixedData=data;
fixedData(fixedData(:,2)<0,:)=[];
x=fixedData(:,1);
y=log(fixedData(:,2));
r=polyfit(x,y,1);
n=r(1);
return
end
