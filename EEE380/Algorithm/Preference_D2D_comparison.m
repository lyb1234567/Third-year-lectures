function preference_D2D=Preference_D2D_comparison(D2D,QiD_optimal)

preference_D2D={};
for i=1:size(D2D,1)
    QiD_sub=QiD_optimal(i,:);
    temp=sort(QiD_sub,'descend');
    index_array=[];
    EE_array=[];
    zero_index=[];
    zeros=[];
    for j=1:size(temp,2)
        index=find(QiD_sub==temp(j));
        if temp(j)==0
            zero_index=[index];
            zeros(end+1)=0;
            continue;
        end
        index_array(end+1)=index;
        EE_array(end+1)=temp(j);
    end
    index_array=[index_array zero_index];
    EE_array=[EE_array zeros];
    preference_D2D{i,1}=EE_array;
    preference_D2D{i,2}=index_array;
end
end