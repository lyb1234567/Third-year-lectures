Pkc=0.1995262315;
Pth1=10*10^(-6);
Pmax=0.1995262315;
Tmin=2;

D2D_use=[];
[D2D,CUE]=system_model(50,50,60);
[Sid,InfD,EhaD,hiD,hki,hiB,hkc]=Prematch(D2D,CUE,Pkc,Pth1,Pmax,Tmin,60);
Sid=clean_Sid(Sid);
hki_SWIPT=clean_hki_SWIPT(hki,Sid,CUE,EhaD);
I=20;
phi=0;

for i=1:size(D2D,2)
    D2D_use(end+1)=i;
end

EhaD=D2D_use;

[lambda_final_SWIPT,EE_final_SWIPT]=inner_Random_matching_SWIPT(Pkc,D2D,CUE,EhaD,Sid,I,phi,hiD,hki_SWIPT,hiB,hkc);
[lambda_optimal_Random_matching,EE_optimal_Random_matching]=outer_Random_matching(Pkc,lambda_final_SWIPT,EE_final_SWIPT,hiD,hki_SWIPT,EhaD,Sid);
D_preference_Random_matching=preference_D2D(EE_optimal_Random_matching,EhaD);
[CUE_preference_Random_matching,original]=preference_CUE_Random_matching(hiB,EhaD,CUE,Sid);
[final_partner_Random_matching,unmatched_CUE_Random_matching]=stable_SWIPT(CUE,EhaD,Sid,D_preference_Random_matching,CUE_preference_Random_matching);
EE_link=final_EE(EhaD,final_partner_Random_matching,EE_optimal_Random_matching,CUE,Sid);
sum_EE=sum(EE_link);
% 
% hki_non_EH=clean_hki_non_EH(InfD,hki,unmatched_CUE_Random_matching);
% EE_non_EH_Random_matching=inner_non_EH_Random_matching(Pkc,D2D,CUE,InfD,unmatched_CUE_Random_matching,I,phi,hiD,hki_non_EH,hiB,hkc);
% InfD_preference=preference_D2D_non_EH(EE_non_EH,InfD);
% % [unmatched_CUE_preference,original_non_EH]=preference_CUE_non_EH(unmatched_CUE,InfD,hiB,PiD_non_EH,CUE);
% % non_EH_partner=stable_non_EH(unmatched_CUE,InfD,InfD_preference,unmatched_CUE_preference);
% % EE_link_non_EH=final_EE_non_EH(InfD,non_EH_partner,EE_non_EH);
% % sum_EE_non_EH=sum(EE_link_non_EH);