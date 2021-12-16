function test_premaching_number()
Pkc=0.1995262315;
Pth1=10*10^(-6);
Pmax=0.1995262315;
Tmin=2;
total=[];
for p=10:10:70
fail_rate=[];
for i=1:2
[D2D,CUE]=system_model(p,p,10);
for j=1:100
[Sid,InfD,EhaD]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,10);
fail=size(InfD,2)/p;
fail_rate(i,j)=fail;
end
end
fail_rate_total=sum(fail_rate(:))/200;
total(end+1)=fail_rate_total;
p
end
number=10:10:70;
total=100*total;
plot(number,total,'-o')
title('Prematching failure rate[%]')
xlabel('Number of D2D links')
ylabel('Prematching failure rate[%]')
saveas(gcf,[pwd '/1/myFig.fig']);
end