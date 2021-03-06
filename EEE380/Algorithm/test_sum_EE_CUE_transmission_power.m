function test_sum_EE_CUE_transmission_power()
%Parameter from Parameter table
final_sum=[];
Pkc_array=[0.00001 0.0001 0.001 0.01 0.1];
for j=1:size(Pkc_array,2)
j
Pkc=Pkc_array(j);
sum_EE=[];
Pth1=10*10^(-6);
Pmax=0.1995262315;
Tmin=2;
%Noise
N0=1*10^(-13);
N1=1*10^(-13);
% Using Pre-Matching 
[D2D,CUE]=system_model(30,30,10);
plot_model(D2D,CUE);
[Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,10);
Sid=clean_Sid(Sid);
number=[];
for i=1:size(Sid,1)
    number(end+1)=size(Sid{i,1},1);
end
bar(EhaD,number);
xlabel('D2D from EnaD');
ylabel('Number of partners for each D2D link ');
%clean the power gain of CUE k and D2D link i

hki_SWIPT=clean_hki_SWIPT(hki,Sid,CUE,EhaD);

I=20;
phi=0;
[lambda,PiD_SWIPT,EE_SWIPT]=inner_SWIPT(Pkc,D2D,CUE,EhaD,Sid,I,phi,hiD,hki_SWIPT,hiB,hkc);
[lambda_optimal,PiD_optimal,EE_optimal]=outer(Pkc,lambda,PiD_SWIPT,EE_SWIPT,hiD,hki_SWIPT,EhaD,Sid);
D_preference=preference_D2D(EE_optimal,EhaD);
[C_preference,original]=preference_CUE(hiB,PiD_optimal,EhaD,CUE,Sid);
[final_partner,unmatched_CUE]=stable_SWIPT(CUE,EhaD,Sid,D_preference,C_preference);
EE_link=final_EE(EhaD,final_partner,EE_optimal,CUE,Sid);
sum_EE=sum(EE_link);

hki_non_EH=clean_hki_non_EH(InfD,hki,unmatched_CUE);
[EE_non_EH,PiD_non_EH]=inner_non_EH(Pkc,D2D,CUE,InfD,unmatched_CUE,I,phi,hiD,hki_non_EH,hiB,hkc);
InfD_preference=preference_D2D_non_EH(EE_non_EH,InfD);
[unmatched_CUE_preference,original_non_EH]=preference_CUE_non_EH(unmatched_CUE,InfD,hiB,PiD_non_EH,CUE);
non_EH_partner=stable_non_EH(unmatched_CUE,InfD,InfD_preference,unmatched_CUE_preference);
EE_link_non_EH=final_EE_non_EH(InfD,non_EH_partner,EE_non_EH);
sum_EE_non_EH=sum(EE_link_non_EH);

final_sum(end+1)=sum_EE+sum_EE_non_EH
end
final_sum
Pkc_array=W_to_dBm(Pkc_array);
plot(Pkc_array,final_sum,'-o');
title('Sum Energy Efficiency against CUE transmission power');
xlabel('CUE transmission power[dBm]');
ylabel('Sum Energy Efficiency[bits/Hz/J]');
saveas(gcf,[pwd '/simulation_results/Sum Energy Efficiency against CUE transmission power.fig']);
end