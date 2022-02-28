function [matched_partner]=stable(CUE,EhaD,Sid,D2D_preference,CUE_preference)

mateched_partner=containers.Map('KeyType','int32','ValueType','int32');
unmatched_D2D=[];
proposal=containers.Map('KeyType','int32','ValueType','any');
for k=1:size(CUE_preference,1)
    proposal(k)=[];
end
remove_D2D=[];
EhaD_sub=EhaD;
number_zeros=size(find(EhaD==0),2);
while number_zeros<size(EhaD,2)
    EhaD=EhaD(EhaD~=0);
    for i=1:size(EhaD,2)
        preference=D2D_preference{i,2};
        most_preferred=preference(1,1);
        partner=Sid{i,1};
        most_preferred_coordinate=partner(most_preferred,:);
        most_preferred_location=location_CUE(CUE,most_preferred_coordinate);
        a=proposal(most_preferred_location);
        a(end+1)=EhaD(i);
        proposal(most_preferred_location)=a;
        for k=1:size(partner,1)
            CUE_coordinate=partner(k,:);
            CUE_location=location_CUE(CUE,CUE_coordinate);
            proposal_k=proposal(CUE_location);
            %检查得到的proposal 矩阵里面是否有EhaD(i)
            check=any(proposal_k==EhaD(i));
            if check
                if size(proposal_k,2)==1
                    matched_partner(EhaD(i))=CUE_location;
                    EhaD(EhaD==EhaD(i))=0;
                elseif size(proposal_k,2)>1
                    find_match=false;
                    for n=1:size(proposal_k,2)
                        %假如说总共收到不止一个D2D link 的proposal,那么我们就需要检查这其中是否有D2D
                        %link只有1一个proposal要发出,for eaxample: proposal_k=[3 7 10]
                        %then we need to scan it to check if 3 , 7 and 10
                        %if one of them has only one preference
                        index=find_EhaD_location(proposal_k(1,n),EhaD);
                        D2D_preference_n=D2D_preference{index,2};
                        if size(D2D_preference_n,2)==1
                            find_match=true;
                            matched_partner(proposal_k(1,n))=CUE_location;
                            EhaD(EhaD==proposal_k(1,n))=0;
                            break;
                        end
                    end
                    if find_match==false
                         CUE_preference_sub=CUE_preference{CUE_location,2};
                         more_preferred_index=CUE_more_preferred(CUE_preference_sub,proposal_k);
                         more_preferred=CUE_preference_sub(1,more_preferred_index);
                         EhaD(EhaD==more_preferred)=0;
                    end
                end
            end
        end
    end
    number_zeros=size(find(EhaD==0),2);
    new_D2D_preference=delete_most_preferred(D2D_preference);
    D2D_preference=new_D2D_preference;
end
end