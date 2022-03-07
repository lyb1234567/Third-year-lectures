function test_sum_EE_CUE_transmission_power()
%Parameter from Parameter table
Pkc_array=[0.00001 0.0001 0.001 0.01 0.1];
sum_EE=[];
iteration=10;
for n=1:size(Pkc_array,2)
sum_EE_sub=0;
n
for k=1:iteration
Pkc=Pkc_array(n);
Pth1=10*10^(-6);
Pmax=0.1995262315;
Tmin=2;

%Noise
N0=1*10^(-13);
N1=1*10^(-13);
% Using Pre-Matching 
[D2D,CUE]=system_model(20,20,20);
plot_model(D2D,CUE);
% [Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,20);
% Sid=clean_Sid(Sid);
% hki=clean_hki(hki,Sid,CUE);
[Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,20);
Sid=clean_Sid(Sid);
number=[];
for i=1:size(Sid,1)
    number(end+1)=size(Sid{i,1},1);
end
bar(EhaD,number);
xlabel('D2D from EnaD');
ylabel('Number of partners for each D2D link ');
%clean the power gain of CUE k and D2D link i
hki=clean_hki(hki,Sid,CUE,EhaD);
I=10;
phi=0;
[lambda,PiD,EE]=inner(Pkc,D2D,CUE,EhaD,Sid,I,phi,hiD,hki,hiB,hkc);
[lambda_optimal,PiD_optimal,EE_optimal]=outer(Pkc,lambda,PiD,EE,hiD,hki,EhaD,Sid);
D_preference=preference_D2D(EE_optimal,EhaD);
[C_preference,original]=preference_CUE(hiB,PiD_optimal,EhaD,CUE,Sid);
final_partner=stable(CUE,EhaD,Sid,D_preference,C_preference);
EE_link=final_EE(EhaD,final_partner,EE_optimal,CUE,Sid);
sum_EE_sub=sum_EE_sub+sum(EE_link);
end
sum_EE(end+1)=sum_EE_sub/iteration;
end
Pkc_dBm=W_to_dBm(Pkc_array);
plot(Pkc_dBm,sum_EE,'LineWidth',4)
title('Sum Energy Efficiency at different CUE transmission power Pkc');
xlabel('CUE transmission power[dBm]');
ylabel('Sum Energy Efficiency[bits/Hz/J]');
end