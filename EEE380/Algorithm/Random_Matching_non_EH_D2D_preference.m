function D_preference=Random_Matching_non_EH_D2D_preference(EE_cell,InfD)
D_preference={};
 for i=1:size(InfD,2)
      preference_EE_value=[];
      preference_EE_index=[];
      EE_sub=EE_cell{i,1};
      temp=[];
      temp_sub=[];
      for k=1:size(EE_sub,2)
          temp(end+1)=EE_sub(1,k);
          temp_sub(end+1)=EE_sub(1,k);
      end
      while size(temp,2)>0
           [argvalue, argmax] = max(temp);
           preference_EE_value(end+1)=argvalue;
           if argvalue>0
            if size(find(temp_sub==argvalue),2)>1
                preference_EE_index=[preference_EE_index find(temp_sub==argvalue)];
            else
                preference_EE_index(end+1)=find(temp_sub==argvalue);
            end
            temp(temp==argvalue)=[];
           else
              preference_EE_index=[preference_EE_index find(temp_sub==argvalue)];
              temp=[];
           end
      end
      D_preference{i,1}=preference_EE_value;
     D_preference{i,2}=preference_EE_index;
end