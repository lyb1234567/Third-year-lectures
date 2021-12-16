function test_prematching_distance()
Pkc=0.1995262315;
Pth1=0.8*10^(-6);
Pmax=0.1995262315;
Tmin=2;
total=[];
for p=10:10:70
fail_rate=[];
for i=1:2
[D2D,CUE]=system(70,70,p);
for j=1:100
[Sid,InfD,EhaD]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,p);
fail=size(InfD,2)/70;
fail_rate(i,j)=fail;
end
end
fail_rate_total=sum(fail_rate(:))/10000;
total(end+1)=fail_rate_total;
p
end
number=10:10:70;
total=100*total;
plot(number,total,'-o');
title('Prematching failure rate[%]');
xlabel('r(m)');
ylabel('Prematching failure rate[%]');
Pkc=0.1995262315;
Pth1=0.8*10^(-6);
Pmax=0.1995262315;
Tmin=2;
total=[];
for p=10:10:70
fail_rate=[];
for i=1:2
[D2D,CUE]=system(70,70,p);
for j=1:100
[Sid,InfD,EhaD]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,p);
fail=size(InfD,2)/70;
fail_rate(i,j)=fail;
end
end
fail_rate_total=sum(fail_rate(:))/10000;
total(end+1)=fail_rate_total;
p
end
number=10:10:70;
total=100*total;
plot(number,total,'-o');
title('Prematching failure rate[%]');
xlabel('r(m)');
ylabel('Prematching failure rate[%]');
saveas(gcf,[pwd '/simulation_results/myFig.fig']);
end