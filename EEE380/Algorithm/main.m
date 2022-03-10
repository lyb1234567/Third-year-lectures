%Parameter from Parameter table
Pkc=0.1995262315;
final_sum=[];
number_CUE_D2D=[10 20 30 40 50];
for j=1:size(number_CUE_D2D,2)
number_sub=number_CUE_D2D(j);
sum_EE=[];
Pth1=10*10^(-6);
Pmax=0.1995262315;
Tmin=2;
%Noise
N0=1*10^(-13);
N1=1*10^(-13);
% Using Pre-Matching 
[D2D,CUE]=system_model(number_sub,number_sub,15);
plot_model(D2D,CUE);
% [Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,20);
% Sid=clean_Sid(Sid);
% hki=clean_hki(hki,Sid,CUE);
[Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,15);
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

final_sum(end+1)=sum_EE+sum_EE_non_EH;
end
plot(number_CUE_D2D,final_sum,'-o');
title('Sum Energy Efficiency against number of D2D or CUE');
xlabel('Number of D2D or CUE');
ylabel('Sum Energy Efficiency');
