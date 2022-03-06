function EE=final_EE(EhaD,partner,EE_cell,CUE,Sid)
EE=[];
for i=1:size(EhaD,2)
    partner_sub=partner(EhaD(i));
    partner_coordinate=CUE(partner_sub,:);
    Sid_sub=Sid{i,1};
    Sid_index=Sid_location(Sid_sub, partner_coordinate)
    EE_sub=EE_cell{i,1};
    EE_sub_value=EE_sub(Sid_index);
    EE(end+1)=EE_sub_value{1};
end
end