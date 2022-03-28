Pkc=0.1995262315;
Pth1=10*10^(-6);
Pmax=0.1995262315;
USE_min=0.5;
Tmin=2;
Number=[10 20 30 40 50];
sum_final_comparison=[];
sum_final_original=[];
sum_final_linear=[];
for n=1:size(Number,2)
n
[D2D,CUE]=system_model(Number(n),Number(n),20);
[Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,20);
[QiD_optimal,PiD_optimal]=iterative_comparison(CUE,D2D,Pmax,Pkc,USE_min,hiD,hki);
preference_D2D_comparison=Preference_D2D_comparison(D2D,QiD_optimal);
[preference_CUE_comparison,Energy_harvested]=Preference_CUE_comparison(PiD_optimal,D2D,CUE,hki,hkc,Pkc);
D2D_use=[];
for i=1:size(D2D,1)
    D2D_use(end+1)=i;
end
matched_partner=stable_comparison(CUE,D2D_use,preference_CUE_comparison,preference_D2D_comparison);
EE=final_EE_comparison(D2D_use,matched_partner,QiD_optimal);
sum_EE=sum(EE);
sum_final_comparison(end+1)=sum_EE;


%The original
Sid=clean_Sid(Sid);
hki_SWIPT=clean_hki_SWIPT(hki,Sid,CUE,EhaD);
I=20;
phi=0;
[lambda,PiD_SWIPT,EE_SWIPT]=inner_SWIPT(Pkc,D2D,CUE,EhaD,Sid,I,phi,hiD,hki_SWIPT,hiB,hkc);
[lambda_optimal,PiD_optimal,EE_optimal]=outer(Pkc,lambda,PiD_SWIPT,EE_SWIPT,hiD,hki_SWIPT,EhaD,Sid);
D_preference_linear=preference_D2D(EE_optimal,EhaD);
[C_preference_linear,original]=preference_CUE(hiB,PiD_optimal,EhaD,CUE,Sid);
[final_partner,unmatched_CUE]=stable_SWIPT(CUE,EhaD,Sid,D_preference_linear,C_preference_linear);
EE_link=final_EE(EhaD,final_partner,EE_optimal,CUE,Sid);
sum_EE_SWIPT=sum(EE_link);

hki_non_EH=clean_hki_non_EH(InfD,hki,unmatched_CUE);
[EE_non_EH,PiD_non_EH]=inner_non_EH(Pkc,D2D,CUE,InfD,unmatched_CUE,I,phi,hiD,hki_non_EH,hiB,hkc);
InfD_preference=preference_D2D_non_EH(EE_non_EH,InfD);
[unmatched_CUE_preference,original_non_EH]=preference_CUE_non_EH(unmatched_CUE,InfD,hiB,PiD_non_EH,CUE);
non_EH_partner=stable_non_EH(unmatched_CUE,InfD,InfD_preference,unmatched_CUE_preference);
EE_link_non_EH=final_EE_non_EH(InfD,non_EH_partner,EE_non_EH);
sum_EE_non_EH=sum(EE_link_non_EH);

sum_final_original(end+1)=sum_EE_SWIPT+sum_EE_non_EH



%The Linear Energy Harvesting
[lambda_final_SWIPT_linear,PiD_final_SWIPT_linear,EE_final_SWIPT_linear]=inner_Linear_SWIPT(Pkc,D2D,CUE,EhaD,Sid,I,phi,hiD,hki_SWIPT,hiB,hkc);
[lambda_optimal_linear,PiD_optimal_linear,EE_optimal_linear]=outer(Pkc,lambda_final_SWIPT_linear,PiD_final_SWIPT_linear,EE_final_SWIPT_linear,hiD,hki_SWIPT,EhaD,Sid);
D_preference_linear=preference_D2D(EE_optimal_linear,EhaD);
[C_preference_linear,original_linear]=preference_CUE(hiB,PiD_optimal_linear,EhaD,CUE,Sid);
[final_partner_linear,unmatched_CUE_linear]=stable_SWIPT(CUE,EhaD,Sid,D_preference_linear,C_preference_linear);
EE_link=final_EE(EhaD,final_partner_linear,EE_optimal_linear,CUE,Sid);
sum_EE_linear_SWIPT=sum(EE_link);

hki_non_EH_linear=clean_hki_non_EH(InfD,hki,unmatched_CUE_linear);
[EE_non_EH_linear,PiD_non_EH_linear]=inner_non_EH(Pkc,D2D,CUE,InfD,unmatched_CUE_linear,I,phi,hiD,hki_non_EH_linear,hiB,hkc);
InfD_preference_linear=preference_D2D_non_EH(EE_non_EH_linear,InfD);
[unmatched_CUE_preference_linear,original_non_EH]=preference_CUE_non_EH(unmatched_CUE_linear,InfD,hiB,PiD_non_EH_linear,CUE);
non_EH_partner_linear=stable_non_EH(unmatched_CUE_linear,InfD,InfD_preference_linear,unmatched_CUE_preference_linear);
EE_link_non_EH_linear=final_EE_non_EH(InfD,non_EH_partner_linear,EE_non_EH_linear);
sum_EE_non_EH_linear=sum(EE_link_non_EH_linear);

sum_final_linear(end+1)=sum_EE_linear_SWIPT+sum_EE_non_EH_linear
end
plot(Number,sum_final_original,'-^',Number,sum_final_comparison ,'-s',Number,sum_final_linear,'o');
xlabel('Number of D2D links or CUE links');
ylabel('Sum Energy Efficiency [bits/Hz/J]');
legend('Piecewise Linear EH model','Scheme in [11]','Linear EH model');