function preference_D2D=Preference_D2D_comparison(D2D,QiD_optimal)

preference_D2D={};
for i=1:size(D2D,1)
    QiD_sub=QiD_optimal(i,:);
    temp=sort(QiD_sub,'descend');
    index_array=[];
    EE_array=[];
    for j=1:size(temp,2)
        index=find(QiD_sub==temp(j));
        index_array(end+1)=index;
        EE_array(end+1)=temp(j);
    end
    preference_D2D{i,1}=EE_array;
    preference_D2D{i,2}=index_array;
end
end