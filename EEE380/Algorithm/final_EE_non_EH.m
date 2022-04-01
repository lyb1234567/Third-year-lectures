function EE=final_EE_non_EH(InfD,partner,EE_cell)
EE=[];

keys_partner=keys(partner);
index=[];
for p=1:size(keys_partner,2)
    index(end+1)=keys_partner{1,p};
end
for i=1:size(InfD,2)
   if isempty(find(index==i))
       continue;
   end
   partner_CUE=partner(i);
   EE_sub=EE_cell{i,1};
   EE_link=EE_sub{1,partner_CUE};
   EE(end+1)=EE_link;
end
end