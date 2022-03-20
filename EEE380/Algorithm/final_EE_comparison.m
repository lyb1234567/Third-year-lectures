function EE=final_EE_comparison(D2D,partner,QiD_optimal)
EE=[];
for i=1:size(D2D,2)
    partner_selected=partner(D2D(i));
    EE_sub=QiD_optimal(i,partner_selected);
    EE(end+1)=EE_sub;
end
end