Pkc=0.1995262315;
Pth1=10*10^(-6);
Pmax=0.1995262315;
USE_min=0.5;
Tmin=2;
distance=[20 30 40 50 60];
sum_final_comparison=[];
sum_final_original=[];
sum_final_linear=[];
sum_final_Random_matching=[];
for n=1:size(distance,2)
 n
[D2D,CUE]=system_model(20,20,distance(n));
[Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,distance(n));
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
D_preference=preference_D2D(EE_optimal,EhaD);
[C_preference,original]=preference_CUE(hiB,PiD_optimal,EhaD,CUE,Sid);
[final_partner,unmatched_CUE]=stable_SWIPT(CUE,EhaD,Sid,D_preference,C_preference);
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


%Random Matching with Pmax
[lambda_final_SWIPT,EE_final_SWIPT]=inner_Random_matching_SWIPT(Pkc,D2D,CUE,EhaD,Sid,I,phi,hiD,hki_SWIPT,hiB,hkc);
[lambda_optimal_Random_matching,EE_optimal_Random_matching]=outer_Random_matching(Pkc,lambda_final_SWIPT,EE_final_SWIPT,hiD,hki_SWIPT,EhaD,Sid);
D_preference_Random_matching=preference_D2D(EE_optimal_Random_matching,EhaD);
[CUE_preference_Random_matching,original]=preference_CUE_Random_matching(hiB,EhaD,CUE,Sid);
[final_partner_Random_matching,unmatched_CUE_Random_matching]=stable_SWIPT(CUE,EhaD,Sid,D_preference_Random_matching,CUE_preference_Random_matching);
EE_link_Random_matching=final_EE(EhaD,final_partner_Random_matching,EE_optimal_Random_matching,CUE,Sid);
sum_EE_Random_matching=sum(EE_link_Random_matching);

hki_non_EH=clean_hki_non_EH(InfD,hki,unmatched_CUE_Random_matching);
EE_non_EH_Random_matching=inner_non_EH_Random_matching(Pkc,D2D,CUE,InfD,unmatched_CUE_Random_matching,I,phi,hiD,hki_non_EH,hiB,hkc);
InfD_D2D_preference=Random_Matching_non_EH_D2D_preference(EE_non_EH_Random_matching,InfD);
[InfD_CUE_preference,original_EE]=Random_matching_preference_CUE_non_EH(unmatched_CUE_Random_matching,InfD,hiB,CUE);
non_EH_partner=stable_non_EH(unmatched_CUE_Random_matching,InfD,InfD_D2D_preference,InfD_CUE_preference);
EE_link_non_EH=final_EE_non_EH_Random_Matching(InfD,non_EH_partner,EE_non_EH_Random_matching);
sum_EE_non_EH_Random=sum(EE_link_non_EH);

sum_final_Random_matching(end+1)=sum_EE_Random_matching+sum_EE_non_EH_Random;



end
plot(distance,sum_final_original,'-^',distance,sum_final_comparison ,'-s',distance,sum_final_linear,'-o',distance,sum_final_Random_matching,'-rp');
xlabel('Communication distance r(m)');
ylabel('Sum Energy Efficiency [bits/Hz/J]');
legend('Piecewise Linear EH model','Scheme in [11]','linear EH model','Random Matching with Pmax');