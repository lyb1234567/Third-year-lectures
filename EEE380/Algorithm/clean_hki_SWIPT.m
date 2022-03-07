function hki_clean=clean_hki_SWIPT(h_C_D2D,Sid,CUE,EhaD)
hki_clean={};
for i=1:size(Sid,1)
    temp={};
    for k=1:size(Sid{i,1},1)
        CUE_group=Sid{i,1};
        CUE_coordinate=CUE_group(k,:);
        CUE_location=location_CUE(CUE,CUE_coordinate);
        hkc=h_C_D2D(i,CUE_location);
        temp{1,CUE_location}=hkc;
    end
    a=temp;
    a_clean=a(~cellfun('isempty',a));
    hki_clean{i,1}=a_clean;
end
for i=1:size(EhaD,2)
    hki_clean{i,2}=num2str(EhaD(1,i));
end
end