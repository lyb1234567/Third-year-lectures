function [CUE_preference original]=preference_CUE(hiB,PiD,EhaD,CUE,Sid)
list={};
CUE_preference={};
for k=1:size(CUE,1)
    temp={};
    CUE_coordinate=CUE(k,:);
    for i=1:size(EhaD,2)
        Sid_sub=Sid{i,1};
        PiD_sub=PiD{i,1};
        hiB_sub=hiB(EhaD(i));
        index=Sid_location(Sid_sub,CUE_coordinate);
        if index==-1
            temp{1,i}=[];
        else
            PiD_interference=PiD_sub{1,index};
            temp{1,i}=interference(hiB_sub,PiD_interference);
        end
    end
    list{k,1}=temp;
end
original=list;
for i=1:size(list,1)
    temp=[];
    temp_sub=[];
    temp_number=[];
    list_sub=list{i,1};
    preference_interference_value=[];
    preference_interference_index=[];
    for k=1:size(list_sub,2)
        a=list_sub{1,k};
        if (~isempty(a)) && (a~=0)
            temp(end+1)=a;
            temp_sub(end+1)=a;
            temp_number(end+1)=k;
        end
    end
    while size(temp,2)>0
        [argvalue, argmin]=min(temp);
        preference_interference_value(end+1)=argvalue;
        index=find(temp_sub==argvalue);
        preference_interference_index(end+1)=temp_number(index);
        temp(temp==argvalue)=[];
    end
    CUE_preference{i,1}=preference_interference_value;
    CUE_preference{i,2}=preference_interference_index;
end
