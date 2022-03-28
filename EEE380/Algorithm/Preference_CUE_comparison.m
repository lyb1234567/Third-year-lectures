function [preference, Energy_harvested]=Preference_CUE_comparison(PiD_optimal,D2D,CUE,hki,hkc,Pkc)
 N0=3.9810717055e-15;
 N1=3.9810717055e-15;
 Energy_harvested=[];
for k=1:size(CUE,1)
    delta_I=random(0.2,0.8);
    delta_E=1-delta_I;
    hkc_sub=hkc(k);
    for i=1:size(D2D,1)
        PiD=PiD_optimal(k,i);
        hki_sub=hki(k,i);
        Energy_harvested(k,i)=Energy_Harvesting_comparison(PiD,hki_sub,hkc_sub,Pkc,delta_E);
    end
end

for k=1:size(CUE,1)
    Energy_harvested_sub=Energy_harvested(k,:);
    temp=sort(Energy_harvested_sub,'descend');
    index_array=[];
    EH_array=[];
    for j=1:size(temp,2)
        index=find(Energy_harvested_sub==temp(j));
        if size(index,2)>1
            index_array=[index_array index];
            EH_array(end+1)=temp(j);
            continue;
        end
        index_array(end+1)=index;
        EH_array(end+1)=temp(j);
    end
    preference{k,1}=EH_array;
    preference{k,2}=index_array;
end
end