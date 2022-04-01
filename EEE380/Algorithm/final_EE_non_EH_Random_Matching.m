function EE=final_EE_non_EH_Random_Matching(InfD,partner,EE_cell)
EE=[];
for i=1:size(InfD,2)
   partner_CUE=partner(i);
   EE_sub=EE_cell{i,1};
   EE_link=EE_sub(1,partner_CUE);
   EE(end+1)=EE_link;
end
end