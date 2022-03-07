function hki_clean=clean_hki_non_EH(InfD,hki,unmatched_CUE)
hki_clean={};
for i=1:size(InfD,2)
    temp={};
    for k=1:size(unmatched_CUE,2)
        h_C_D2D=hki(InfD(i),unmatched_CUE(k));
        temp{1,unmatched_CUE(k)}=h_C_D2D;
    end
    a=temp;
    a_clean=a(~cellfun('isempty',a));
    hki_clean{i,1}=a_clean;
end
end