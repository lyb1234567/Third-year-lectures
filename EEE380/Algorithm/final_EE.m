function EE=final_EE(EhaD,partner,EE_cell,CUE,Sid)
EE=[];
for i=1:size(EhaD,2)
    CUE_location=partner(i);
    CUE_coord=CUE(CUE_location,:);
    Sid_sub=Sid{i,1};
    locatin_Sid=Sid_location(Sid_sub,CUE_coord);
    EE_sub=EE_cell{i,1};
    EE_link=EE_sub{1,locatin_Sid};
    EE(end+1)=EE_link;
end
end